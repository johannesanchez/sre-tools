brew tap aws/tap
brew install aws-sam-cli

sam init
#sam init --name my-sam-app --runtime python3.7 --app-template hello-world


sam local invoke


Build Succeeded

Built Artifacts  : .aws-sam/build
Built Template   : .aws-sam/build/template.yaml

Commands you can use next
=========================
[*] Validate SAM template: sam validate
[*] Invoke Function: sam local invoke
[*] Test Function in the Cloud: sam sync --stack-name {{stack-name}} --watch
[*] Deploy: sam deploy --guided
