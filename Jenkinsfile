def installAnsible(){
    sh """
        echo "Current Directory"
        cd $WORKSPACE
        pwd
        echo ""
        echo "listing directory"
        env
        ls -ltr $WORKSPACE
        ls -ltr $WORKSPACE/jenkins
        ls -ltr $WORKSPACE/jenkins/scripts
        ls -ltr $WORKSPACE/jenkins/scripts/hello.sh
        ls -ltr jenkins
        ls -ltr jenkins/scripts
        ls -ltr jenkins/scripts/hello.sh
        chmod +x "jenkins/scripts/hello.sh"
        echo ""
        jenkins/scripts/hello.sh
    """
}

pipeline {
    agent any
    
    parameters {
        choice(
            name: 'env_type',
            choices: 'dev,sit,uat,pt,prod',
            description: 'Environment to deploy to')
          choice(
            name: 'Component_type',
            choices: 'AM, IG, IDM, DS',
            description: 'Component to deploy to')      
        booleanParam(
            name: 'clear_env',
            defaultValue: false, 
            description: 'Clearing Environment')
        booleanParam(
            name: 'deploy_env',
            defaultValue: false, 
            description: 'Deploying Environment')
        string(
            name: 'project',
            defaultValue: 'Sample Project',
            description: 'Project Name')
    }
    
    environment {
        EXAMPLE = "EXAMPLE"
    }
    
    stages {
        stage('Clear Environment') {
            when {
                expression { params.clear_env == true }
            }
            steps {
                echo "*** Clear Environment ***"
                installAnsible()
                sh """
                    cd $WORKSPACE
                    chmod 400 ansible/keys/id_rsa
                    ansible-playbook removefile.yaml 
                """
            }
        }
        stage('Create Environment') {
            when {
                expression { params.deploy_env == true }
            }
            steps {
                echo "*** Creating Environment ***"
                installAnsible()
                sh """
                    cd $WORKSPACE/ansible/
                    chmod 400 keys/id_rsa
                    cd playbooks
                    ansible-playbook setup_rs.yaml
                """
            }
        }
    }   
}
