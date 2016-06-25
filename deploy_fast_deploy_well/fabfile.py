from fabric.api import *

''' Deploys codebase via github.com/rickharris-dev/microblog-project.git'''

env.hosts = ['158.69.91.92']
env.user = 'admin'
env.shell = '/bin/bash -c'

def pack(remote="origin", branch="master"):
    code_dir = '$HOME/microblog-project'

    with lcd(code_dir):
        ''' - Opted to not have fabric commit files to prevent unwanted code
            - Pull prevents errors during push, but may produce conflicts '''
        local("git pull " + remote + " " + branch)
        local("git push " + remote + " " + branch)

def deploy(remote="origin", branch="master"):
    ''' - Initializes deployment with default remote origin and branch master
        - Github iprange 192.30.252.0/22 tcp permitted through iptables
        - Prompts for SSH key password to verify authority to pull files '''

    code_dir = '/var/www/microblog-project'

    with cd(code_dir):
        run("git pull " + remote + " " + branch)
