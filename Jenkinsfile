pipeline {
  agent any

  environment {
    DEVICE_ID = "your_device_serial"
    LOG_DIR = "logs/"
  }

  stages {
    stage('Checkout Source') {
      steps {
        git url: 'https://your.git.repo/ts-validator.git', branch: 'main'
      }
    }

    stage('Build Android') {
      steps {
        sh 'bash scripts/build_android.sh'
      }
    }

    stage('Flash Device') {
      steps {
        sh 'bash scripts/flash_device.sh $DEVICE_ID'
      }
    }

    stage('Display Validation') {
      steps {
        sh 'python3 scripts/run_display_tests.py'
      }
    }

    stage('Camera Validation') {
      steps {
        sh 'python3 scripts/run_camera_tests.py'
      }
    }

    stage('Audio Validation') {
      steps {
        sh 'python3 scripts/run_audio_tests.py'
      }
    }

    stage('Log Collection') {
      steps {
        sh 'bash scripts/collect_logs.sh $DEVICE_ID'
      }
    }

    stage('Archive Logs') {
      steps {
        archiveArtifacts artifacts: 'logs/**'
      }
    }
  }

  post {
    success {
      mail to: 'qa-team@company.com',
           subject: '✅ TS-VALIDATOR Build Success',
           body: 'System-level validation completed successfully.'
    }
    failure {
      mail to: 'qa-team@company.com',
           subject: '❌ TS-VALIDATOR Build Failed',
           body: 'Check Jenkins console and logs.'
    }
  }
}
