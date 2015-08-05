
import sys,subprocess

'''If we want lines like
    hello world flibble
broken into separate entities, do that in a separate step.'''
class Zargs:
    '''Replacement for xargs'''
    def __init__(self):
        self.mytask = None # Needs to be a lambda taking a list
    def task(self,t):
        self.mytask = t
        return self
    def assemblecmd(self,before,after):
        self.task(lambda t: before+t+after)
        return self
    def makecmd(self,before,after=[]):
        if type(before) is type(""):
            before = [before]
        if type(after) is type(""):
            after = [after]
        return self.assemblecmd(before,after)
    def makecmds(self,before,after=[]):
        if type(before) is type(""):
            before = before.split()
        if type(after) is type(""):
            after = after.split()
        return self.assemblecmd(before,after)
    def go(self,nargs = None,infile = sys.stdin):
        if self.mytask is None:
            print("No task",file=sys.stderr)
            return
        a = list(map(lambda t: t.rstrip(),infile.readlines()))
        l = len(a)
        if nargs is None or nargs < 1 or nargs >= l:
            m = l
        else:
            m = nargs
        n = l // m # number of sets
        for i in range(n):
            xs = a[i*m:(i+1)*m]
            cmd = self.mytask(xs)
            subprocess.call(cmd)
