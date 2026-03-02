// If you want to test the app on your physical device then
// open command prompt and run ipconfig, then copy the IP address
// which looks something like this 192.168.0.XX and paste in MAIN_URL
// for virtual emulators you should use https://localhost:8080 instead
// TODO: change according to yours
// const SERVER_URL = 'http://localhost:8080';

// Chỗ này nhớ là dùng máy ảo mới có địa chỉ này khi dùng máy thật ta sẽ có địa chỉ khác
const SERVER_URL = 'http://10.0.2.2:3000';
const ONESIGNAL_APP_ID = 'd35c8cac-461c-47f2-91ee-b288db64ee5e';
// d35c8cac-461c-47f2-91ee-b288db64ee5e
const CURRENCY_SYMBOL = "\u0024";

// preference keys, no need to change
const FAVORITE_PRODUCT_BOX = 'FAVORITE_PRODUCT_BOX';
const USER_INFO_BOX = 'USER_INFO_BOX';
const PHONE_KEY = 'PHONE_KEY';
const STREET_KEY = 'STREET_KEY';
const CITY_KEY = 'CITY_KEY';
const STATE_KEY = 'STATE_KEY';
const POSTAL_CODE_KEY = 'POSTAL_CODE_KEY';
const COUNTRY_KEY = 'COUNTRY_KEY';

// sorting options
const SORT_PRICE_LOW_TO_HIGH = 'Low To High';
const SORT_PRICE_HIGH_TO_LOW = 'High To Low';
const CATEGORY_ALL = 'All';

// do not change, if you must then edit from server-side too
const PAYMENT_METHOD_COD = 'COD';
const PAYMENT_METHOD_PREPAID = 'Prepaid';

// do not change
const ORDER_STATUS_ALL = 'All orders';
const ORDER_STATUS_PENDING = 'Pending';
const ORDER_STATUS_PROCESSING = 'Processing';
const ORDER_STATUS_SHIPPED = 'Shipped';
const ORDER_STATUS_DELIVERED = 'Delivered';
const ORDER_STATUS_CANCELLED = 'Cancelled';
