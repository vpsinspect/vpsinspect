package version

// Name is the tool name reported by the CLI.
const Name = "vpsinspect"

// Version is the release version. The release workflow replaces it at build
// time with -ldflags "-X github.com/vpsinspect/vpsinspect/pkg/version.Version=<version>".
var Version = "0.0.0-dev"
