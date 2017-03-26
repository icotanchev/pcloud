# pcloud

Simple connection to https://www.pcloud.com

## Compatibility
* Ruby 2.x
* Rails >= 4.0

## Installing

Add into Gemfile add:

```
gem 'pcloud', git: 'https://github.com/icotanchev/pcloud'
```

Then **bundle install** to install it

```
rails generate pcloud
```

which will generate config/pcloud.yml file to set user name and password
```
username: YOUR_USERNAME
password: YOUR_PASSWORD
```

## Upload file to pcloud

```
Pcloud.upload(source_file_name, source_file_path, destination_path, destination_folder_id)
```

One of **destination_path** or **destination_folder_id** should present

## List folder from pcloud

```
Pcloud.list_folder(destination_path = nil, destination_folder_id = nil)
```

One of **destination_path** or **destination_folder_id** should present

## Create folder on pcloud

```
Pcloud.create_folder(destination_folder_id, folder_name)
```

Currently it works only with folder_id 

## License

Config is released under the [MIT License.](https://opensource.org/licenses/MIT)
