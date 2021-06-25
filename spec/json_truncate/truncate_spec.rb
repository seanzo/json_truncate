require 'spec_helper'

describe JsonTruncate do
    it "should remove nested objects" do
        o = { foo: 'bar', bar: { baz: 'foo' }}

        expect(JsonTruncate.truncate(
            o,
            max_depth: 1
        )).to eql({ foo: 'bar', bar: {}})
        expect(o).to eql({ foo: 'bar', bar: { baz: 'foo' }})
    end

    it "should remove array items" do
        o = { foo: [ 'foo', 'bar', 'baz' ], bar: { baz: [ 'foo', 'bar' ]}}

        expect(JsonTruncate.truncate(
            o,
            max_array_length: 1
        )).to eql({ foo: [ 'foo', '...' ], bar: { baz: [ 'foo', '...' ]}})
        expect(o).to eql({ foo: [ 'foo', 'bar', 'baz' ], bar: { baz: [ 'foo', 'bar' ]}})
    end

    it "should truncate strings" do
        o = { foo: '1234567890', bar: { baz: '1234567890', bat: [ '1234567890' ]}}

        expect(JsonTruncate.truncate(
            o,
            max_string_length: 5
        )).to eql({ foo: '12345...', bar: { baz: '12345...', 'bat': [ '12345...' ]}})
        expect(o).to eql({ foo: '1234567890', bar: { baz: '1234567890', bat: [ '1234567890' ]}})
    end
end