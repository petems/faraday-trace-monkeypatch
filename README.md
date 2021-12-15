# faraday-trace-monkeypatch

An example of using a monkeypatch to add additional tags to the Faraday middleware for Datadog Ruby tracing

## How to use

```
$ bundle exec ruby main.rb
I, [2021-12-15T20:20:52.953744 #42016]  INFO -- ddtrace: [ddtrace] DATADOG TRACER CONFIGURATION - {"date":"2021-12-15T20:20:52+00:00","os_name":"x86_64-apple-darwin19","version":"0.54.1","lang":"ruby","lang_version":"2.7.3","enabled":true,"service":"main","agent_url":"http://127.0.0.1:8126?timeout=30","debug":false,"analytics_enabled":false,"runtime_metrics_enabled":false,"integrations_loaded":"faraday@1.8.0","vm":"ruby-2.7.3","partial_flushing_enabled":false,"priority_sampling_enabled":false,"health_metrics_enabled":false,"integration_faraday_analytics_enabled":"false","integration_faraday_analytics_sample_rate":"1.0","integration_faraday_enabled":"true","integration_faraday_service_name":"faraday","integration_faraday_distributed_tracing":"true","integration_faraday_error_handler":"#<Proc:0x00007f98be9c2710 /Users/peter.souter/.rbenv/versions/2.7.3/lib/ruby/gems/2.7.0/gems/ddtrace-0.54.1/lib/ddtrace/contrib/faraday/configuration/settings.rb:12 (lambda)>","integration_faraday_split_by_domain":"false"}
```

You'll need to have the Datadog agent running and listening on `8126`, otherwise you'll see something like this:

```
E, [2021-12-15T19:11:40.439570 #21103] ERROR -- ddtrace: [ddtrace] (/Users/peter.souter/.rbenv/versions/2.7.3/lib/ruby/gems/2.7.0/gems/ddtrace-0.54.1/lib/ddtrace/transport/http/client.rb:37:in `rescue in send_request') Internal error during HTTP transport request. Cause: Failed to open TCP connection to 127.0.0.1:8126 (Connection refused - connect(2) for "127.0.0.1" port 8126) Location: /Users/peter.souter/.rbenv/versions/2.7.3/lib/ruby/2.7.0/net/http.rb:960:in `initialize'
```

You should then see two APM traces, one for get with a query string, the other for post with a body:

## Post

[![Post][1]][1]

## Get

[![Get][2]][2]

  [1]: https://i.stack.imgur.com/7FI4r.png
  [2]: https://i.stack.imgur.com/ZBy3l.png