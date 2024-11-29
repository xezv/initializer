add_pkg() {
    pkg=$1
    shift
    ${pkg} "$@"
}
