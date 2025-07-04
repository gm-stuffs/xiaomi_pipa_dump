source_traces_path='/data/misc/perfetto-traces/records'
dest_traces_path='/data/local/traces'
file_type="performance.perfetto-trace"

file_to_move=$(find "$source_traces_path" -type f -name "*${file_type}" -print -quit | xargs basename)

if [ -n "$file_to_move" ]; then
    tar -jcf "${source_traces_path}/${file_to_move}.tar.bz2" -C "${source_traces_path}" "${file_to_move}" && \
    rm "${source_traces_path}/${file_to_move}" && \
    mv "${source_traces_path}/${file_to_move}.tar.bz2" "${dest_traces_path}/${file_to_move}" && \
    chmod 666 "${dest_traces_path}/${file_to_move}"
    chcon u:object_r:trace_data_file:s0 "${dest_traces_path}/${file_to_move}"
fi

