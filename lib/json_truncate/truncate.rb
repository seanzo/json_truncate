module JsonTruncate
    def self.truncate(object, opts = {})
        process(object.dup, opts)
    end

    def self.process(object, opts, depth = 0)
        depth += 1

        if opts[:max_array_length] && object.is_a?(Array) && object.length > opts[:max_array_length]
            object.slice!(opts[:max_array_length]..-1)
            object.push('...')
        end

        if opts[:max_string_length] && object.is_a?(String) && object.length > opts[:max_string_length]
            object.slice!(opts[:max_string_length]..-1)
            object << '...'
        end

        if opts[:max_depth] && depth > opts[:max_depth] && [ Array, Hash ].include?(object.class)
            object.delete_if { |_| true }
        end

        if object.is_a?(Hash)
            object.each do |k,v|
                process(v, opts, depth)
            end
        elsif object.is_a?(Array)
            object.each do |v|
                process(v, opts, depth)
            end
        end

        object
    end
end