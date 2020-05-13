cd ~/project/ros2_test

colcon build

sudo docker run -it x64/ros2/dashing ./project/ros2_test/build/examples_rclcpp_minimal_publisher/publisher_lambda
