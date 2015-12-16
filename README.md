# Maybe

[![Build Status][travis-image]][travis-url]

Utils to deal with errors

## Installation

First, add maybe to your dependencies in `mix.exs`:

    def deps do
        [{:maybe, "~> 0.0.1"}]
    end

Then, update your dependencies:

    $ mix deps.get

## Usage

    import Maybe

    Poison.encode(payload)
      |> ok(fn(encoded)-> HTTPoison.request(:post, url, encoded) end)
      |> ok(fn(%{body: body})-> Poison.decode(body) end)
      |> ok(fn(decoded)-> process(decoded) end)
      |> error(&IO.inspect/1)

[travis-image]: https://img.shields.io/travis/zweifisch/maybe.svg?style=flat
[travis-url]: https://travis-ci.org/zweifisch/maybe
