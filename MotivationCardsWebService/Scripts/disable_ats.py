import os

def disable_ats():
    os.environ['NSAllowsArbitraryLoads'] = 'YES'

if __name__ == '__main__':
    disable_ats()