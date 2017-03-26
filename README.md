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

which will generate config/pcloud.yml file to set auth_type, user name and password or OAuth token
```
auth_type: plain/oauth
username: YOUR_USERNAME
password: YOUR_PASSWORD
access_token: YOUR_OAUTH_TOEKB
```

## Upload file to pcloud

```
Pcloud.upload(source_file_name, source_file_path, destination_folder_id)
```

## List folder from pcloud

```
Pcloud.list_folder(destination_folder_id)
```

## Create folder on pcloud

```
Pcloud.create_folder(destination_folder_id, folder_name)
```

## Create delete folder on pcloud

```
Pcloud.delete_folder(destination_folder_id)
```

## Create delete file on pcloud

```
Pcloud.delete_file(destination_file_id)
```

## Get file link on pcloud

```
Pcloud.get_file_link(destination_file_id)
```

## Download file by link

```
Pcloud.download_file(file_url, destination_path)
```

## Download file by id on pcloud

```
Pcloud.download_file_by_id(file_id, destination_path)
```
## License

Config is released under the [MIT License.](https://opensource.org/licenses/MIT)
