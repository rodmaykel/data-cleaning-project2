library("data.table")

openFile <- function(x) {
  read.table(x, header=FALSE)
}

getMeanSD <- function(data) {
  cbind(rowMeans(data), apply(data,1,sd))
}

# read, label, mean/sd, merge
user <- openFile("test/subject_test.txt")
#x <- openFile("test/X_test.txt")
y <- openFile("test/y_test.txt")
y <- ordered(y[,1], labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
body_acc_x <- getMeanSD(openFile("test/Inertial Signals/body_acc_x_test.txt"))
body_acc_y <- getMeanSD(openFile("test/Inertial Signals/body_acc_x_test.txt"))
body_acc_z <- getMeanSD(openFile("test/Inertial Signals/body_acc_y_test.txt"))

body_gyro_x <- getMeanSD(openFile("test/Inertial Signals/body_gyro_x_test.txt"))
body_gyro_y <- getMeanSD(openFile("test/Inertial Signals/body_gyro_y_test.txt"))
body_gyro_z <- getMeanSD(openFile("test/Inertial Signals/body_gyro_z_test.txt"))

total_acc_x <- getMeanSD(openFile("test/Inertial Signals/total_acc_x_test.txt"))
total_acc_y <- getMeanSD(openFile("test/Inertial Signals/total_acc_y_test.txt"))
total_acc_z <- getMeanSD(openFile("test/Inertial Signals/total_acc_z_test.txt"))

data1 <- data.frame(user, y, body_acc_x, body_acc_y, body_acc_z, body_gyro_x, body_gyro_y, body_gyro_z, total_acc_x, total_acc_y, total_acc_z)

user <- openFile("train/subject_train.txt")
#x <- openFile("train/X_train.txt")
y <- openFile("train/y_train.txt")
y <- ordered(y[,1], labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
body_acc_x <- getMeanSD(openFile("train/Inertial Signals/body_acc_x_train.txt"))
body_acc_y <- getMeanSD(openFile("train/Inertial Signals/body_acc_x_train.txt"))
body_acc_z <- getMeanSD(openFile("train/Inertial Signals/body_acc_y_train.txt"))

body_gyro_x <- getMeanSD(openFile("train/Inertial Signals/body_gyro_x_train.txt"))
body_gyro_y <- getMeanSD(openFile("train/Inertial Signals/body_gyro_y_train.txt"))
body_gyro_z <- getMeanSD(openFile("train/Inertial Signals/body_gyro_z_train.txt"))

total_acc_x <- getMeanSD(openFile("train/Inertial Signals/total_acc_x_train.txt"))
total_acc_y <- getMeanSD(openFile("train/Inertial Signals/total_acc_y_train.txt"))
total_acc_z <- getMeanSD(openFile("train/Inertial Signals/total_acc_z_train.txt"))

data2 <- data.frame(user, y, body_acc_x, body_acc_y, body_acc_z, body_gyro_x, body_gyro_y, body_gyro_z, total_acc_x, total_acc_y, total_acc_z)

data <- rbind(data1, data2)

i <- 1
colnames(data)[i] <- "person"; i <- i+1;
colnames(data)[i] <- "activity"; i <- i+1;

colnames(data)[i] <- "body_acc_x_mean"; i <- i+1;
colnames(data)[i] <- "body_acc_x_sd"; i <- i+1;
colnames(data)[i] <- "body_acc_y_mean"; i <- i+1;
colnames(data)[i] <- "body_acc_y_sd"; i <- i+1;
colnames(data)[i] <- "body_acc_z_mean"; i <- i+1;
colnames(data)[i] <- "body_acc_z_sd"; i <- i+1;

colnames(data)[i] <- "body_gyro_x_mean"; i <- i+1;
colnames(data)[i] <- "body_gyro_x_sd"; i <- i+1;
colnames(data)[i] <- "body_gyro_y_mean"; i <- i+1;
colnames(data)[i] <- "body_gyro_y_sd"; i <- i+1;
colnames(data)[i] <- "body_gyro_z_mean"; i <- i+1;
colnames(data)[i] <- "body_gyro_z_sd"; i <- i+1;

colnames(data)[i] <- "total_acc_x_mean"; i <- i+1;
colnames(data)[i] <- "total_acc_x_sd"; i <- i+1;
colnames(data)[i] <- "total_acc_y_mean"; i <- i+1;
colnames(data)[i] <- "total_acc_y_sd"; i <- i+1;
colnames(data)[i] <- "total_acc_z_mean"; i <- i+1;
colnames(data)[i] <- "total_acc_z_sd"; i <- i+1;


dt <- data.table(data)

dt[,list(body_acc_x_mean=mean(body_acc_x_mean),
         body_acc_x_sd=mean(body_acc_x_sd),
         body_acc_y_mean=mean(body_acc_y_mean),
         body_acc_y_sd=mean(body_acc_y_sd),
         body_acc_z_mean=mean(body_acc_z_mean),
         body_acc_z_sd=mean(body_acc_z_sd),
         body_gyro_x_mean=mean(body_gyro_x_mean),
         body_gyro_x_sd=mean(body_gyro_x_sd),
         body_gyro_y_mean=mean(body_gyro_y_mean),
         body_gyro_y_sd=mean(body_gyro_y_sd),
         body_gyro_z_mean=mean(body_gyro_z_mean),
         body_gyro_z_sd=mean(body_gyro_z_sd),
         total_acc_x_mean=mean(total_acc_x_mean),
         total_acc_x_sd=mean(total_acc_x_sd),
         total_acc_y_mean=mean(total_acc_y_mean),
         total_acc_y_sd=mean(total_acc_y_sd),
         total_acc_z_mean=mean(total_acc_z_mean),
         total_acc_z_sd=mean(total_acc_z_sd)),
   by="person,activity"]

