[![Build Status](https://travis-ci.org/Josef-Friedrich/jekyll-auto-image-include.svg?branch=master)](https://travis-ci.org/Josef-Friedrich/jekyll-auto-image-include)

# jekyll-auto-image-include

This jekyll plugin automatically includes images.

## Usage

```Liquid
{% auto_image_include %}
```

```Liquid
{% auto_image_include /path/to/images %}
```

### Configuration

`_config.yml`:

```yaml
auto_image_include:
  recursive: true
  pattern: "*.{jpg,jpeg,png,gif,bmp,tif,tiff,svg}"

```

## Links

* [Source code on Github](https://github.com/Josef-Friedrich/jekyll-auto-image-include)
* [Project page on rubygems](https://rubygems.org/gems/jekyll-auto-image-include)
