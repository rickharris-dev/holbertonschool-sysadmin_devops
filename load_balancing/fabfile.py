from fabric.api import *

''' Deploys codebase via github.com/rickharris-dev/microblog-project.git'''

env.hosts = ['52.91.120.197']
env.user = 'ubuntu'
env.shell = '/bin/bash -c'

def iptables():
    run("sudo su root; apt-get install iptables")
    pass

def apache():
    pass

def dns():
    pass

def deploy(remote="origin", branch="master"):
    ''' - Initializes deployment with default remote origin and branch master
        - Github iprange 192.30.252.0/22 tcp permitted through iptables
        - Prompts for SSH key password to verify authority to pull files '''

    code_dir = '/var/www/microblog-project'

    with cd(code_dir):
        run("git pull " + remote + " " + branch)

def maintenance_on():
    code_dir = '/var/www/microblog-project'

    with cd(code_dir):
        run("touch maintenance.enable")

def maintenance_off():
    code_dir = '/var/www/microblog-project'

    with cd(code_dir):
        run("rm maintenance.enable")
