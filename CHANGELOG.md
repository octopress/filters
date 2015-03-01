# Changelog

### 1.3.3 - 2015-02-28

- Minor Change: Do not downcased canonical URLs as authors may not have control over URL case.

### 1.3.2 - 2015-02-14

- Fix: Ensure site instance is available before hooks trigger.

### 1.3.1 - 2015-02-14

- Fix: issue with access to site instance.

### 1.3.0 - 2015-02-08

- New: Added excerpted state to post data, e.g. {{ post.excerpted }} # true/false

### 1.2.6 - 2015-01-24

- Fix: Baseurl expansion no longer breaks root relative URLs.

### 1.2.5 - 2015-01-24

- New: join_url filter, works like File.join.
- New: smart_slash filter. Appends trailing slashes to URLs when appropriate.
- Fix: Ensure a baseurl isn't added twice when expanding URLs.

### 1.2.4 - 2015-01-23

- Simple domains won't end in trailing slashes (eg: http://example.com doesn't need a trailing slash).

### 1.2.3 - 2015-01-23

- Full URLs will end with trailing slashes when appropriate

### 1.2.2 - 2015-01-23

- Added support for baseurl

### 1.2.1 - 2015-01-11

- Added support for Octopress docs

### 1.2.0 - 2014-08-31

- Added `strip_url_protocol` which converts `http://bog.com` to `blog.com`.

### 1.1.2 - 2014-07-26

- Replaced octopress-hooks with something simpler

### 1.1.1 - 2014-07-24

- Now using octopress-hooks for access to Jekyll site.

### 1.1.0 - 2014-07-21

- Added smart quotes filter.
- Added canonical_url filter.
- Now relying on gem for titlecase and smartypants.

### 1.0.0 - 2014-07-20

- Initial release.
