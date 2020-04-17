import pickle

def save_history(path, history):
    with open(path, 'wb') as f:
        pickle.dump(history.history, f)

def load_history(path):
    return pickle.loads(open(path, "rb").read())
