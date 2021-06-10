node('master'){
    def containerName="api-tc-${env.BUILD_NUMBER}"
    def reportsLocation = "/docker_tc_reports"

    stage("Checkout Repository") {
        checkout scm
    }

    stage("Build Docker Image") {
            sh './script/ci imageBuild'
    }

    stage("Run Tests") {

            def exitCode = sh script:'./script/ci testRun '+containerName, returnStatus:true

            // If any tests fail, Jenkins will exit with code 1,
            // which prevents the reporting script from running. Let's mark
            // the build as unstable instead.
            if (exitCode == 1)
                currentBuild.result = "UNSTABLE"
    }

    stage("Generate Test Reports") {
        sh 'mkdir '+"${env.WORKSPACE}"+reportsLocation
        sh './script/ci copyReportsToJenkins '+containerName+' '+reportsLocation
    }

    stage("Delete Container and Docker Image") {
        sh './script/ci removeContainer '+containerName
        sh './script/ci removeImage'
    }

    stage("Publish Reports to Jenkins Build from Workspace") {
        publishHTML([
                allowMissing: false,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: "${env.WORKSPACE}"+reportsLocation,
                reportFiles: '*.html',
                reportName: 'HTML Report',
                reportTitles: ''])
    }
}