/* Retail Analysis Schema */

create table customers(
cust_id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50) not null,
gender enum('Male', 'Female', 'Other'),
date_of_birth date,
email varchar(100) unique,
phone_number varchar(15),
city varchar(50),
state varchar(50),
join_date date not null,
membership_type enum('Regular' ,'Silver', 'Gold', 'Platinum') default 'Regular',
is_active boolean default True,
created_at timestamp default current_timestamp,
last_updated timestamp default current_timestamp on update current_timestamp
);


create table category(
category_id int primary key auto_increment,
category_name varchar(50) not null unique,
is_active boolean default true,
created_at timestamp default current_timestamp
);


CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status enum('Pending', 'Shipped', 'Out for delivery', 'Delivered', 'Cancelled'),
    FOREIGN KEY (customer_id) REFERENCES Customers(cust_id)
    on delete cascade
);



CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK(quantity > 0),
    price_at_purchase DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);


CREATE INDEX idx_customer_id ON Orders(customer_id);
CREATE INDEX idx_order_id ON Order_Items(order_id);
CREATE INDEX idx_product_id ON Order_Items(product_id);


CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name varchar(50) not null unique,
    contact_person varchar(50) not null,
    contact_number varchar(15) not null,
    contact_email varchar(100) not null unique,
    city varchar(50) not null,
    state varchar(50) not null,
    is_active boolean default true,
    created_at timestamp default current_timestamp
    on update current_timestamp
);


create table returns (
return_id int primary key auto_increment,
order_item_id int not null,
returned_quantity int not null check (returned_quantity > 0),
return_amount decimal(10,2) not null check (return_amount >= 0),
return_reason varchar(255),
return_status enum('Pending', 'Approved', 'Rejected', 'Completed') DEFAULT 'Pending',
return_date datetime not null,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,

FOREIGN KEY (order_item_id)
REFERENCES order_items(order_item_id)
);

	
CREATE TABLE stores (
    store_id INT PRIMARY KEY AUTO_INCREMENT,
    store_name varchar(50) not null unique,
    city varchar(50) not null,
    state varchar(50) not null,
	store_contact VARCHAR(15) NOT NULL,
    opening_date DATE NOT NULL,
    manager_id INT NULL,
    monthly_rent DECIMAL(10,2),
    is_active boolean default true,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
    on update current_timestamp
);

CREATE TABLE employees(
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(100) not null unique,
    contact_number varchar(15) not null,
    designation varchar(25) not null,
    salary decimal(10,2) not null check (salary >=0),
    date_of_birth date,
    date_joined date not null,
    gender enum('Male', 'Female', 'Others'),
    city varchar(50) not null,
    state varchar(50) not null,
    store_id int null,
    is_active boolean default true,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
    on update current_timestamp,
    FOREIGN KEY (store_id)
REFERENCES stores(store_id)
);

create table payments (
payment_id int primary key auto_increment,
order_id int not null,
payment_mode enum('Cash', 'UPI', 'Net Banking', 'Credit Card', 'Debit Card') not null,
amount decimal(10,2) not null check (amount >= 0),
transaction_id varchar(100) null unique,
payment_status enum( 'Pending', 'Successful', 'Failed', 'Refunded') DEFAULT 'Pending',
payment_date datetime not null,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (order_id)
REFERENCES orders(order_id)
);


