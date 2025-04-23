# Go

## Installation

[go.dev](https://go.dev/doc/install)

1. Download the file (for example `go1.24.2.linux-amd64.tar.gz`)
2. Remove any previous Go installation by deleting the `/usr/local/go` folder (if it exists)

```
rm -rf /usr/local/go
```

3. Copy the file `go1.24.2.linux-amd64.tar.gz` into the directory `/usr/local`
4. Extract the archive you just downloaded into `/usr/local`, creating a fresh Go tree in `/usr/local/go`

```
tar -C /usr/local -xzf go1.24.2.linux-amd64.tar.gz
```

5. Add `/usr/local/go/bin` to the PATH environment variable in the file `.bashrc`

```
export PATH=$PATH:/usr/local/go/bin
```
