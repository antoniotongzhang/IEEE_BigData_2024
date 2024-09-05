import os
import pandas as pd
import numpy as np
from sklearn import datasets, linear_model
from sklearn.linear_model import SGDRegressor
from sklearn.neural_network import MLPRegressor
from sklearn.model_selection import KFold
from sklearn.metrics import mean_absolute_percentage_error
from sklearn.ensemble import RandomForestRegressor

normalized_folder1 = os.path.join('..', 'normalized/syscall/train')
normalized_folder2 = os.path.join('..', 'normalized/syscall/test')

data = pd.read_csv(os.path.join(normalized_folder1, 'sn_new_syscall_nor.csv'))

# Load test datasets
test_datasets = {
    'c': pd.read_csv(os.path.join(normalized_folder2, 'sn_syscall_c_nor.csv')),
    'm': pd.read_csv(os.path.join(normalized_folder2, 'sn_syscall_m_nor.csv')),
    'i': pd.read_csv(os.path.join(normalized_folder2, 'sn_syscall_i_nor.csv')),
    'n': pd.read_csv(os.path.join(normalized_folder2, 'sn_syscall_n_nor.csv')),
    'lp': pd.read_csv(os.path.join(normalized_folder2, 'lp_syscall_nor.csv')),
    'rea': pd.read_csv(os.path.join(normalized_folder2, 'rea_syscall_nor.csv')),
    'ytb': pd.read_csv(os.path.join(normalized_folder2, 'ytb_syscall_nor.csv')),
    'mg': pd.read_csv(os.path.join(normalized_folder2, 'mg_syscall_nor.csv'))
}

# Feature selection
features = ['accept', 'accept4', 'access', 'alarm', 'arch_prctl', 'bind', 'brk', 'clock_gettime', 'clock_nanosleep', 'clone', 'close', 'connect', 'execve', 'fcntl', 'flock', 'fsync', 'ftruncate', 'futex', 'getcwd', 'getdents64', 'geteuid', 'getpeername', 'getpid', 'getppid', 'getrandom', 'getrusage', 'getsockname', 'getsockopt', 'gettimeofday', 'getuid', 'ioctl', 'kill', 'listen', 'lseek', 'madvise', 'mkdir', 'mlock', 'mmap', 'mprotect', 'msync', 'munmap', 'newfstatat', 'openat', 'perf_event_open', 'pipe2', 'prctl', 'pread64', 'preadv', 'preadv2', 'prlimit64', 'pselect6', 'pwritev', 'pwritev2', 'read', 'readv', 'recvfrom', 'rmdir', 'rseq', 'rt_sigaction', 'rt_sigprocmask', 'sched_getaffinity', 'sendto', 'set_robust_list', 'set_tid_address', 'setpgid', 'setsockopt', 'shutdown', 'sigaltstack', 'socket', 'statfs', 'sysinfo', 'times', 'truncate', 'umask', 'uname', 'unlink', 'wait4', 'write', 'writev']
target = 'energy'

X_train = data[features].values
y_train = data[target].values.ravel()

# Prepare test datasets
X_tests = {key: df[features].values for key, df in test_datasets.items()}
y_tests = {key: df[target].values.ravel() for key, df in test_datasets.items()}

# Models
models = {
    'LR': linear_model.LinearRegression(),
    'LASSO': linear_model.Lasso(max_iter=2000, random_state=42),
    'RIDGE': linear_model.Ridge(max_iter=2000, random_state=42),
    'SGD': SGDRegressor(max_iter=2000, random_state=42),
    'MLP': MLPRegressor(max_iter=2000, random_state=42),
    'RF': RandomForestRegressor(random_state=42)    
}

# Cross-validation
def cross_validate_model(model, X, y, n_splits):
    kf = KFold(n_splits=n_splits, shuffle=True, random_state=42)
    mape_list = []
    for train_index, val_index in kf.split(X):
        X_tr, X_val = X[train_index], X[val_index]
        y_tr, y_val = y[train_index], y[val_index]
        model.fit(X_tr, y_tr)
        y_pred = model.predict(X_val)
        mape = mean_absolute_percentage_error(y_val, y_pred)
        mape_list.append(mape)
    return mape_list

cv_results = {n_splits: {name: {'MAPE': []} for name in models.keys()} for n_splits in [5, 10]}

# Perform cross-validation for both 5 and 10 folds
for n_splits in [5, 10]:
    for name, model in models.items():
        mape_list = cross_validate_model(model, X_train, y_train, n_splits)
        cv_results[n_splits][name]['MAPE'] = mape_list

# Display cross-validation results
for n_splits, results in cv_results.items():
    print(f"\nCross-Validation with {n_splits} folds:")
    for name, metrics in results.items():
        metrics_df = pd.DataFrame(metrics)
        mean_metrics = metrics_df.mean()
       
        print(f"\nModel: {name}")
        print(mean_metrics)
        

# Evaluation
def evaluate_model(model, X_test, y_test):
    y_pred = model.predict(X_test)
    mape = mean_absolute_percentage_error(y_test, y_pred)
    return mape, y_test, y_pred

# Train each model 
fitted_models = {}
for name, model in models.items():
    model.fit(X_train, y_train)  
    fitted_models[name] = model  

# Evaluate on test sets 
def evaluate_model_on_tests(fitted_models, X_tests, y_tests):
    test_results = {key: {} for key in X_tests.keys()}
    for key, X_test in X_tests.items():
        y_test = y_tests[key]
        for name, model in fitted_models.items():
            mape, y_true, y_pred = evaluate_model(model, X_test, y_test)
            test_results[key][name] = {'MAPE': mape}
            print(f"{key} - {name}: MAPE = {mape:.4f}")
    return test_results

test_results = evaluate_model_on_tests(fitted_models, X_tests, y_tests)

