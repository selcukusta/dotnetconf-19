# Dotnet Conf 19 Sample Application

Follow these steps to use enviroment variables and Kubernetes secrets in your .NET Core applications.

- Create new configuration file

  `echo '{ "Hello" : "World" }' > secret.json`

- Cretate secret object in Kubernetes

  `kubectl create secret generic app-secret --from-file=secret.json`

- Apply deployment and service object for sample application

  `kubectl apply -f manifest.yaml`

- Get current pod name

  `kubectl get pods`

- Port-forward it!

  `kubectl port-forward pod/dotnetconf-99cd46fd8-ddshg 30000:80`

- Check the output

  `curl localhost:30000/api/values`

It should be; `["It's from environment!","World"]` and it's done!
