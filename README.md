# App exchange rate

# 0) Installing Fastlane

Fastlane is a ruby gem, and as such requires a ruby environment setup on your mac. I recommend installing the latest stable version through RVM: `\curl -sSL https://get.rvm.io | bash -s stable --ruby`

In case that is sorted out, next we need to make sure that the `bundler` gem is installed to allows to setup a specific gem environment for this project.

`gem install bundler`

Since we now have bundler installed we can add the dependencies into a `Gemfile`

```
source 'https://rubygems.org'

gem 'fastlane'

```
With fastlane installed, let's try initializing it:

`bundle exec fastlane init`

Fastlane will ask your for your Apple ID and your password which will be saved to the keychain of your mac.

`Your Apple ID (e.g. fastlane@krausefx.com): rarg15@gmail.com`

`Password (for rarg15@gmail.com): **********`

# TL:DR

1. Set Apple ID
2. Set Password
3. Validate fastfile

```
default_platform(:ios)

platform :ios do
  desc "Create app on Apple Developer and App Store Connect sites"
  lane :create_app do
    produce
  end
desc "Take screenshots"
  lane :screenshot do
    snapshot
  end
desc "Create ipa"
  lane :build do
    # 1
    enable_automatic_code_signing
    # 2
    increment_build_number
    # 3
    gym
  end
desc "Upload to App Store"
  lane :upload do
    deliver
  end

  desc “Create app, take screenshots, build and upload to App Store"
  lane :do_everything do
    create_app
    screenshot
    build
    upload
  end

end
```
4. create a `.travis.yml` 
```
osx_image: xcode13.2.
language: swift
install:
  - bundle install
script:
  - bundle exec fastlane do_everything
```
5. Config environment
6. Deploy 🚀




