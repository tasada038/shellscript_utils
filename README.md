# shellscript_utils
shellscript utils for various tasks

## Usage

- Usage: ./signature.sh <data_file>

```sh: terminal
./signature.sh test_sig.md
```
<br>

- Usage: ./verification.sh <data_file> <public_key> <signature_file>

```sh: terminal
./verification.sh test_sig.md public_key_*.pem signature_*.txt
```
<br>


- Usage: ./encryption.sh <file_to_encrypt> <public_key>

```sh: terminal
./encryption.sh test_sig.md public_key_*.pem
```
<br>

- Usage: ./decryption.sh <file_to_decrypt> <private_key>

```sh: terminal
./decryption.sh enc_*.md private_key_*.pem
```
<br>

- Usage: ./folder_tree.sh

```sh: terminal
./folder_tree.sh
```
<br>

- Usage: ./ros_console_log.sh

Please change the ros2 run command from line 9 as appropriate.

```sh: ros_console_log.sh
# Start logging using the script command
script -q -c "ros2 run examples_rclcpp_minimal_publisher publisher_member_function" $LOG_FILE
```
<br>

```sh: terminal
./ros_console_log.sh
```