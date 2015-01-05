module Payload

  DATA1 = {"url"=>"http://jumpstartlab.com/blog",
           "requestedAt"=>"2013-02-16 21:38:28 -0700",
           "respondedIn"=>37,
           "referredBy"=>"http://jumpstartlab.com",
           "requestType"=>"GET",
           "parameters"=>[],
           "eventName"=>"socialLogin",
           "userAgent"=>
           "Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
           "resolutionWidth"=>"1920",
           "resolutionHeight"=>"1280",
           "ip"=>"63.29.38.201"
           }

  DATA2 = {"url"=>"http://jumpstartlab.com/about",
           "requestedAt"=>"2013-02-16 21:38:28 -0700",
           "respondedIn"=>30,
           "referredBy"=>"http://turing.io",
           "requestType"=>"GET",
           "parameters"=>[],
           "eventName"=>"otherEvent",
           "userAgent"=>
           "Opera: Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14",
           "resolutionWidth"=>"1500",
           "resolutionHeight"=>"1300",
           "ip"=>"63.29.38.211"
           }

  DATA3 = {"url"=>"http://jumpstartlab.com/blog",
           "requestedAt"=>"2013-02-16 21:38:28 -0700",
           "referredBy"=>"http://jumpstartlab.com",
           "requestType"=>"GET",
           "eventName"=>"socialLogin",
           "userAgent"=>
           "Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
           "resolutionWidth"=>"1920",
           "resolutionHeight"=>"1280"
           }

  DATA4 = {"url"=>"http://jumpstartlab.com/about",
           "requestedAt"=>"2013-02-17 11:38:28 -0700",
           "respondedIn"=>32,
           "referredBy"=>"http://jumpstartlabs.com",
           "requestType"=>"GET",
           "parameters"=>[],
           "eventName"=>"socialLogin",
           "userAgent"=>
           "Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_5_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
           "resolutionWidth"=>"1600",
           "resolutionHeight"=>"1300",
           "ip"=>"63.29.38.200"
           }
          #  curl -i -d 'payload={"url":"http://jumpstartlab.com/blog","requestedAt":"2013-02-16 21:38:28 -0700","respondedIn":37,"referredBy":"http://jumpstartlab.com","requestType":"GET","parameters":[],"eventName": "socialLogin","userAgent":"Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17","resolutionWidth":"1920","resolutionHeight":"1280","ip":"63.29.38.211"}' http://localhost:9393/sources/jumpstartlab/data
          #  curl -i -d 'payload={"url":"http://jumpstartlab.com/about","requestedAt":"2013-02-17 04:38:28 -0700","respondedIn":20,"referredBy":"http://google.com","requestType":"GET","parameters":[],"eventName": "startedRegistration","userAgent":"Opera: Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14","resolutionWidth":"1600","resolutionHeight":"1280","ip":"63.29.38.200"}' http://localhost:9393/sources/jumpstartlab/data
          #  curl -i -d 'payload={"url":"http://jumpstartlab.com/article/1","requestedAt":"2013-02-17 10:38:28 -0700","respondedIn":17,"referredBy":"http://turing.io","requestType":"GET","parameters":[],"eventName": "addedSocialThroughPromptA","userAgent":"Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_3_3 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8J2 Safari/6533.18.5","resolutionWidth":"1920","resolutionHeight":"1280","ip":"63.29.38.201"}' http://localhost:9393/sources/jumpstartlab/data
          #  curl -i -d 'payload={"url":"http://jumpstartlab.com/blog","requestedAt":"2013-02-18 21:58:28 -0700","respondedIn":35,"referredBy":"http://jumpstartlab.com","requestType":"GET","parameters":[],"eventName": "addedSocialThroughPromptB","userAgent":"Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3","resolutionWidth":"800","resolutionHeight":"600","ip":"63.29.38.202"}' http://localhost:9393/sources/jumpstartlab/data
          #  curl -i -d 'payload={"url":"http://jumpstartlab.com/about","requestedAt":"2013-02-18 11:38:28 -0700","respondedIn":28,"referredBy":"http://jumpstartlab.com","requestType":"GET","parameters":[],"eventName": "socialLogin","userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.112 Safari/534.30","resolutionWidth":"1920","resolutionHeight":"1280","ip":"63.29.38.203"}' http://localhost:9393/sources/jumpstartlab/data
          # #  curl -i -d 'payload={"url":"http://jumpstartlab.com/article/2","requestedAt":"2013-02-19 20:38:28 -0700","respondedIn":08,"referredBy":"http://jumpstartlab.com","requestType":"GET","parameters":[],"eventName": "socialLogin","userAgent":"Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17","resolutionWidth":"1600","resolutionHeight":"1280","ip":"63.29.38.204"}' http://localhost:9393/sources/jumpstartlab/data
          #  curl -i -d 'payload={"url":"http://jumpstartlab.com/contact","requestedAt":"2013-02-19 01:38:28 -0700","respondedIn":34,"referredBy":"http://google.com","requestType":"GET","parameters":[],"eventName": "startedRegistration","userAgent":"Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17","resolutionWidth":"1920","resolutionHeight":"1280","ip":"63.29.38.205"}' http://localhost:9393/sources/jumpstartlab/data
end
