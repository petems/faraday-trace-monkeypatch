require 'faraday'
require 'ddtrace'
require 'ddtrace/contrib/faraday/middleware'

module FaradayExtension
  private
  def annotate!(span, env, options)
    # monkey patch to add body to span
    span.set_tag("http.body", env[:body]) unless env[:body].to_s.strip.empty?
    span.set_tag("http.query", env[:url].query) if env[:url].query
    super
  end
end

Datadog::Contrib::Faraday::Middleware.prepend(FaradayExtension)

Datadog.configure do |c|
  c.use :faraday
end

Faraday.post("http://httpstat.us/200", {foo: 1, bar: 2}.to_json)
Faraday.get("http://httpstat.us/201?foo=1&bar=2")