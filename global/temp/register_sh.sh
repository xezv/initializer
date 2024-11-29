_get_filename_or_exit_if_not_sh() {
    local src_path=$1

    local filename_with_ext="$(basename "${src_path}")"
    local filename="${filename_with_ext%.*}"
    # ${filename##*.} -> only ext(bash param expansion)
    local ext="${filename_with_ext##*.}"

    if [[ "${ext}" != "sh" ]]; then
        echo "[Error] file ${filename_with_ext} is not a shell script. exit."
        exit 1
    fi

    echo "${filename}"
}

register_sh() {
    local src_path=$1
    local filename="$(_get_filename_or_exit_if_not_sh "${src_path}")"
    local target_path="${target_dir}/${filename}"

    if [[ -f "${target_path}" ]]; then
        echo "[File already exists] src: ${src_path}, target: ${target_path}"
        exit 1
    fi

    ln -sf "${src_path}" "${target_path}"
    echo "[Symlink created] src: ${src_path}, target: ${target_path}"
}
