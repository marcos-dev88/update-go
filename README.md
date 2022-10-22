# update-go

# Sumary

1. [Instalation](##Instalation)
2. [About](##About)
3. [Instructions](##Instructions)
4. [Usage](##Usage)

## About

It's a script to update Golang version easily in linux


## Instalation

```bash
$ git clone https://github.com/marcos-dev88/update-go
```


## Instructions

Theres 2 flags that you can use in this project:

* **-v** -> It defines the version like: 1.19 **(Required)**
* **-p** -> It defines the path of your download. **(Not required, but without this flag it will get the go path from your $GOROOT and $GOPATH, then, make sure that you have it defined in your .zshrc or .bashrc)** 

## Usage

#### Getting config of paths from your $GOROOT and $GOPATH.
The official golang doc about GOROOT and GOPATH config: [Go path doc](https://go.dev/doc/gopath_code)
```bash
$ bash ./attgovers.sh -v 1.19
```

#### Install in a path to make installation manually

```bash
$ bash ./attgovers.sh -v 1.19 -p $HOME
```
