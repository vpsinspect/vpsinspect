package main

import (
	"flag"
	"fmt"
	"os"

	"github.com/vpsinspect/vpsinspect/pkg/version"
)

func main() {
	showVersion := flag.Bool("version", false, "print version and exit")
	flag.Bool("no-color", false, "disable color output (reserved)")
	jsonOut := flag.Bool("json", false, "JSON output (reserved)")
	flag.Parse()

	if *showVersion {
		fmt.Println(version.Version)
		return
	}

	if *jsonOut {
		fmt.Printf(`{"tool":%q,"version":%q,"phase":"0","status":"stub"}`+"\n", version.Name, version.Version)
		return
	}

	fmt.Fprintf(os.Stderr, "%s %s (Phase 0 stub; read-only engine not wired yet)\n", version.Name, version.Version)
	os.Exit(0)
}