"""
Fab file deploys local directory to remote server
"""
from fabric.api import *

env.user = 'ubuntu'
env.disable_known_hosts = True
env.shell = '/bin/bash -c'


def pack():
    """ Packs the current working directory into a tar file. """
    local("tar --exclude='*.tar.gz' -cvzf holbertonwebapp.tar.gz .")


def deploy():
    """ Deploy to remote host specified by -H on cmd line. """
    put('holbertonwebapp.tar.gz', '/tmp/')
    with cd('/tmp/'):
        run("mkdir holbertonwebapp")
        run("tar -xf holbertonwebapp.tar.gz -C holbertonwebapp/ > /dev/null")


def clean():
    """ Clean the tar file from the local directory """
    local("rm -f holbertonwebapp.tar.gz")
