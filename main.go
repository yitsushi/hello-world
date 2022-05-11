package main

import (
	"fmt"
	"net/http"
	"os"

	"github.com/go-asset/build"
	"github.com/sirupsen/logrus"
)

const appName = "hello-world"

func main() {
	version, err := build.ReadVersion(appName)
	if err != nil {
		logrus.Error(err)

		return
	}

	http.HandleFunc("/", func(w http.ResponseWriter, _ *http.Request) {
		fmt.Fprintf(w, "%+v", version)
	})

	listen := os.Getenv("LISTEN")
	if listen == "" {
		listen = ":9999"
	}

	logrus.Infof("Start listening on %s", listen)

	if err := http.ListenAndServe(listen, nil); err != nil {
		logrus.Error(err)
	}
}
