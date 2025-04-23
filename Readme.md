# TerraTools

Tools Free for Terraform files

- Lint
- Security


### List Tools

- terrascan
- terralint


### How to use


Create your own image
```
    docker build -t terratools:latest .
```


Run scan

```
docker run --rm -it -v $(pwd):/infra/code terratools:latest tflint /infra/code
```

```
docker run --rm -it -v $(pwd):/infra/code terratools:latest terrascan init /infra/code && terrascan scan /infra/code
```

