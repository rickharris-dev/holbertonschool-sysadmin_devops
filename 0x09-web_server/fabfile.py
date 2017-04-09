from fabric.api import *
from fabric.operations import run, put

''' 
Packs the present working directory into a tar, deploys to remote
server, and then cleans up the local tar file.
'''

env.user = 'ubuntu'
'''env.shell = '/bin/bash -c''''

'''
def pack():
    local("tar --exclude='*.tar.gz' -cvzf holbertonwebapp.tar.gz .")
'''

def deploy():
    deploy_dir = '/tmp/holbertonwebapp'
    put('holbertonwebapp.tar.gz', '/tmp/')
    run("mkdir -p " + deploy_dir)
    run("tar -xf /tmp/holbertonwebapp.tar.gz -C " + deploy_dir)

'''
def clean():
    local("rm -f holbertonwebapp.tar.gz")
'''
