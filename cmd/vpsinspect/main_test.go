package main

import (
	"bytes"
	"io"
	"os"
	"testing"
)

func TestMainVersionJSON(t *testing.T) {
	oldArgs := os.Args
	defer func() { os.Args = oldArgs }()
	os.Args = []string{"vpsinspect", "--json"}

	oldOut := os.Stdout
	r, w, err := os.Pipe()
	if err != nil {
		t.Fatal(err)
	}
	os.Stdout = w
	main()
	_ = w.Close()
	os.Stdout = oldOut

	var buf bytes.Buffer
	if _, err := io.Copy(&buf, r); err != nil {
		t.Fatal(err)
	}
	out := buf.String()
	if out == "" || out[0] != '{' {
		t.Fatalf("expected JSON object, got %q", out)
	}
}