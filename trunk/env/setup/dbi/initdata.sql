-- Igor Azarny iazarny@yahoo.com.
-- Initial data.
--

-- SET character_set_client=utf8;
-- SET character_set_connection=utf8;

INSERT INTO TASSOCIATION(ASSOCIATION_ID, CODE, GUID, NAME, DESCRIPTION)  VALUES (1, 'accessories', 'accessories' , 'Accessories' , 'Product accessories');
INSERT INTO TASSOCIATION(ASSOCIATION_ID, CODE, GUID, NAME, DESCRIPTION)  VALUES (2, 'up',          'up' , 'Up sell' , 'Up sell');
INSERT INTO TASSOCIATION(ASSOCIATION_ID, CODE, GUID, NAME, DESCRIPTION)  VALUES (3, 'cross',       'cross' , 'Cross sell' , 'Cross sell');
INSERT INTO TASSOCIATION(ASSOCIATION_ID, CODE, GUID, NAME, DESCRIPTION)  VALUES (4, 'buywiththis', 'buywiththis' , 'Buy with this products' , 'Shoppers also buy with this product');
INSERT INTO TASSOCIATION(ASSOCIATION_ID, CODE, GUID, NAME, DESCRIPTION)  VALUES (5, 'expendable',  'expendable' , 'Expendable materials' , 'Expendable materials. Example inc for printer');


INSERT INTO TETYPE (ETYPE_ID, JAVATYPE, BUSINESSTYPE, GUID) VALUES (1000, 'java.lang.String', 'String', 'String');
INSERT INTO TETYPE (ETYPE_ID, JAVATYPE, BUSINESSTYPE, GUID) VALUES (1001, 'java.lang.String', 'URI', 'URI');
INSERT INTO TETYPE (ETYPE_ID, JAVATYPE, BUSINESSTYPE, GUID) VALUES (1002, 'java.lang.String', 'URL', 'URL');
INSERT INTO TETYPE (ETYPE_ID, JAVATYPE, BUSINESSTYPE, GUID) VALUES (1003, 'java.lang.String', 'Image', 'Image');
INSERT INTO TETYPE (ETYPE_ID, JAVATYPE, BUSINESSTYPE, GUID) VALUES (1004, 'java.lang.String', 'CommaSeparatedList', 'CommaSeparatedList');
INSERT INTO TETYPE (ETYPE_ID, JAVATYPE, BUSINESSTYPE, GUID) VALUES (1005, 'java.lang.Float', 'Float', 'Float');
INSERT INTO TETYPE (ETYPE_ID, JAVATYPE, BUSINESSTYPE, GUID) VALUES (1006, 'java.lang.Integer', 'Integer', 'Integer');
INSERT INTO TETYPE (ETYPE_ID, JAVATYPE, BUSINESSTYPE, GUID) VALUES (1007, 'java.lang.String', 'Phone', 'Phone');
INSERT INTO TETYPE (ETYPE_ID, JAVATYPE, BUSINESSTYPE, GUID) VALUES (1008, 'java.lang.Boolean', 'Boolean', 'Boolean');
INSERT INTO TETYPE (ETYPE_ID, JAVATYPE, BUSINESSTYPE, GUID) VALUES (1009, 'java.util.Date', 'Date', 'Date');


INSERT INTO TATTRIBUTEGROUP (ATTRIBUTEGROUP_ID, GUID, CODE, NAME, DESCRIPTION) VALUES (1000, 'SYSTEM',   'SYSTEM', 'System settings.', 'System wide settings');
INSERT INTO TATTRIBUTEGROUP (ATTRIBUTEGROUP_ID, GUID, CODE, NAME, DESCRIPTION) VALUES (1001, 'SHOP',     'SHOP', 'Shop settings.', '');
INSERT INTO TATTRIBUTEGROUP (ATTRIBUTEGROUP_ID, GUID, CODE, NAME, DESCRIPTION) VALUES (1002, 'CATEGORY', 'CATEGORY', 'Category settings.', '');
INSERT INTO TATTRIBUTEGROUP (ATTRIBUTEGROUP_ID, GUID, CODE, NAME, DESCRIPTION) VALUES (1003, 'PRODUCT',  'PRODUCT', 'Product settings.', '');
INSERT INTO TATTRIBUTEGROUP (ATTRIBUTEGROUP_ID, GUID, CODE, NAME, DESCRIPTION) VALUES (1004, 'SKU',      'SKU', 'Product SKU settings.', '');
INSERT INTO TATTRIBUTEGROUP (ATTRIBUTEGROUP_ID, GUID, CODE, NAME, DESCRIPTION) VALUES (1005, 'BRAND',    'BRAND', 'Brand settings.', '');
INSERT INTO TATTRIBUTEGROUP (ATTRIBUTEGROUP_ID, GUID, CODE, NAME, DESCRIPTION) VALUES (1006, 'CUSTOMER', 'CUSTOMER', 'Customer settings.', '');


INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  10999,  'CURRENCY', 'CURRENCY',  0,  NULL,  'Currencies',  'Supported currencies by shop. First one is the default',  1004, 1001);

INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11000,  'SYSTEM_DEFAULT_SHOP', 'SYSTEM_DEFAULT_SHOP',  1,  NULL,  'System. Default shop',
  'This value will be used for redirections when shop can not be resolved by http request', 1002,  1000);

INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11040,  'SHOP_B2B', 'SHOP_B2B',  1,  NULL,  'Is B2B profile for this shop',  'Is B2B profile for this shop',  1000, 1001);

INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11099,  'SYSTEM_IMAGE_VAULT', 'SYSTEM_IMAGE_VAULT',  1,  NULL,  'Root directory for image repository',
  'Root directory for image repository', 1000,  1000);



INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11001,  'BRAND_IMAGE', 'BRAND_IMAGE',  1,  NULL,  'Brand image',  null,  1003, 1005);

INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11002,  'CATEGORY_ITEMS_PER_PAGE', 'CATEGORY_ITEMS_PER_PAGE',  0,  NULL,  'Category item per page settings',
   'Category item per page settings with fail over',  1004, 1002);

INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11004,  'CATEGORY_IMAGE', 'CATEGORY_IMAGE',  0,  NULL,  'Category image',   'Category image',  1003, 1002);

INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11005,  'CATEGORY_IMAGE_RETRIEVE_STRATEGY', 'CATEGORY_IMAGE_RETRIEVE_STRATEGY',  0,  NULL,  'Strategy to retrieve image',
  'Strategy to retrieve images. Allowed values: [ATTRIBUTE] i.e. use CATEGORY_IMAGE attribute or [RANDOM_PRODUCT] i.e. random product image will be used',  1000, 1002);

INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11006,  'CATEGORY_DESCRITION_en', 'CATEGORY_DESCRITION_en',  0,  NULL,  'Category Description (en)',
  'Category Description in English (en)',  1000, 1002);

INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11007,  'CATEGORY_DESCRITION_ru', 'CATEGORY_DESCRITION_ru',  0,  NULL,  'Описание Категории (ru)',
  'Описание Категории на Русском (ru)',  1000, 1002);


INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  12000,  'PRODUCT_IMAGE_WIDTH', 'PRODUCT_IMAGE_WIDTH',  0,  NULL,  'Product image width in category',   'Product image width in category',  1006, 1002);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  12001,  'PRODUCT_IMAGE_HEIGHT', 'PRODUCT_IMAGE_HEIGHT',  0,  NULL,  'Product image height in category',   'Product image height in category',  1006, 1002);

INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  12050,  'PRODUCT_IMAGE_TUMB_WIDTH', 'PRODUCT_IMAGE_TUMB_WIDTH',  0,  NULL,  'Product thumbnail image width',   'Product thumbnail image width',  1006, 1002);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  12051,  'PRODUCT_IMAGE_TUMB_HEIGHT', 'PRODUCT_IMAGE_TUMB_HEIGHT',  0,  NULL,  'Product thumbnail image height',   'Product thumbnail image height',  1006, 1002);

INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11998,  'CATEGORY_IMAGE_WIDTH', 'CATEGORY_IMAGE_WIDTH',  0,  NULL,  'Category image  width ',   'Category image width thumbnail ',  1006, 1002);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11999,  'CATEGORY_IMAGE_HEIGHT', 'CATEGORY_IMAGE_HEIGHT',  0,  NULL,  'Category image   height',   'Category image height thumbnail ',  1006, 1002);

INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11008,  'IMAGE0', 'IMAGE0',  1,  NULL,  'Product default image',  'Product default image',  1003, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11009,  'IMAGE1', 'IMAGE1',  0,  NULL,  'Product alternative image 1',  'Product alternative image 1',  1003, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11010,  'IMAGE2', 'IMAGE2',  0,  NULL,  'Product alternative image 2',  'Product alternative image 2',  1003, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11011,  'IMAGE3', 'IMAGE3',  0,  NULL,  'Product alternative image 3',  'Product alternative image 3',  1003, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11012,  'IMAGE4', 'IMAGE4',  0,  NULL,  'Product alternative image 4',  'Product alternative image 4',  1003, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11013,  'IMAGE5', 'IMAGE5',  0,  NULL,  'Product alternative image 5',  'Product alternative image 5',  1003, 1003);

INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11014,  'SKUIMAGE0', 'SKUIMAGE0',  0,  NULL,  'Product SKU default image',  'Product SKU default image',  1003, 1004);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11015,  'SKUIMAGE1', 'SKUIMAGE1',  0,  NULL,  'Product SKU alternative image 1',  'Product SKU alternative image 1',  1003, 1004);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11016,  'SKUIMAGE2', 'SKUIMAGE2',  0,  NULL,  'Product SKU alternative image 2',  'Product SKU alternative image 2',  1003, 1004);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11017,  'SKUIMAGE3', 'SKUIMAGE3',  0,  NULL,  'Product SKU alternative image 3',  'Product SKU alternative image 3',  1003, 1004);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11018,  'SKUIMAGE4', 'SKUIMAGE4',  0,  NULL,  'Product SKU alternative image 4',  'Product SKU alternative image 4',  1003, 1004);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11019,  'SKUIMAGE5', 'SKUIMAGE5',  0,  NULL,  'Product SKU alternative image 5',  'Product SKU alternative image 5',  1003, 1004);

INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11020,  'PRODUCT_DESCRITION_en', 'PRODUCT_DESCRITION_en',  0,  NULL,  'Product Description (en)',  'Product Description in English (en)',  1000, 1003);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11021,  'PRODUCT_DESCRITION_ru', 'PRODUCT_DESCRITION_ru',  0,  NULL,  'Описание Продукта (ru)',  'Описание Продукта на Русском (ru)',  1000, 1003);

INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11022,  'SKUPRODUCT_DESCRITION_en', 'SKUPRODUCT_DESCRITION_en',  0,  NULL,  'Product Description (en)',  'Product Description in English (en)',  1000, 1004);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11023,  'SKUPRODUCT_DESCRITION_ru', 'SKUPRODUCT_DESCRITION_ru',  0,  NULL,  'Описание Продукта (ru)',  'Описание Продукта на Русском (ru)',  1000, 1004);



INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11050,  'CUSTOMER_PHONE', 'CUSTOMER_PHONE',  1,  NULL,  'Phone',  'Phone', 1007,  1006);
INSERT INTO TATTRIBUTE (ATTRIBUTE_ID, GUID, CODE, MANDATORY, VAL, NAME, DESCRIPTION, ETYPE_ID, ATTRIBUTEGROUP_ID)
  VALUES (  11051,  'MARKETING_OPT_IN', 'MARKETING_OPT_IN',  0,  NULL,  'Marketing Opt in',  'If true then customer opted in for marketing contact', 1007,  1006);

INSERT INTO TPRODUCTTYPE (PRODUCTTYPE_ID, GUID, NAME, DESCRIPTION, UISEARCHTEMPLATE, SERVICE, ENSEMBLE, SHIPABLE)
  VALUES (500,'Default Product', 'Default Product','Default Product','default', 0,0,1);
INSERT INTO TPRODUCTTYPE (PRODUCTTYPE_ID, GUID, NAME, DESCRIPTION, UISEARCHTEMPLATE, SERVICE, ENSEMBLE, SHIPABLE)
  VALUES (501,'Default Accessory', 'Default Accessory','Default Accessory','default', 0,0,1);


INSERT INTO TSYSTEM (SYSTEM_ID, GUID, CODE, NAME, DESCRIPTION)  VALUES (100, 'YC', 'SYSTEM','Yes e-commerce platform', 'System table');

INSERT INTO TSYSTEMATTRVALUE ( ATTRVALUE_ID,  VAL,  CODE, SYSTEM_ID, GUID)   VALUES (1000,'http://testdevshop.yes-cart.org:8080/yes-shop','SYSTEM_DEFAULT_SHOP',100, 'YC_SYSTEM_DEFAULT_SHOP');
INSERT INTO TSYSTEMATTRVALUE ( ATTRVALUE_ID,  VAL,  CODE, SYSTEM_ID, GUID)   VALUES (1002,'10,20,40','SEARCH_ITEMS_PER_PAGE',100, 'YC_SEARCH_ITEMS_PER_PAGE');
INSERT INTO TSYSTEMATTRVALUE ( ATTRVALUE_ID,  VAL,  CODE, SYSTEM_ID, GUID)  VALUES (1003,'common/imagevault','SYSTEM_IMAGE_VAULT',100, 'YC_SYSTEM_IMAGE_VAULT');
INSERT INTO TSYSTEMATTRVALUE ( ATTRVALUE_ID,  VAL,  CODE, SYSTEM_ID, GUID)  VALUES (1011,'basePaymentModule,cappPaymentModule,gswmPaymentModule','SYSTEM_PAYMENT_MODULES_URLS',100, 'YC_SYSTEM_PAYMENT_MODULES_URLS');
INSERT INTO TSYSTEMATTRVALUE ( ATTRVALUE_ID,  VAL,  CODE, SYSTEM_ID, GUID)  VALUES (1012,'testPaymentGatewayLabel,courierPaymentGatewayLabel,cyberSourcePaymentGatewayLabel,authorizeNetAimPaymentGatewayLabel,authorizeNetSimPaymentGatewayLabel,payflowPaymentGatewayLabel,payPalNvpPaymentGatewayLabel,payPalExpressPaymentGatewayLabel,liqPayPaymentGatewayLabel','SYSTEM_ACTIVE_PAYMENT_GATEWAYS_LABELS',100, 'YC_SYSTEM_ACTIVE_PAYMENT_GATEWAYS');


INSERT INTO TSHOP (SHOP_ID, NAME, DESCRIPTION, FSPOINTER, IMGVAULT, CODE, GUID)  VALUES (10, 'YesCart shop', 'YesCart shop', 'default', '/default/imagevault', 'SHOP10', 'SHOP10');

INSERT INTO TWAREHOUSE (WAREHOUSE_ID, GUID, CODE, NAME, DESCRIPTION) VALUES (1, 'Main', 'Main', 'Main warehouse', null);
INSERT INTO TSHOPWAREHOUSE (SHOPWAREHOUSE_ID, SHOP_ID, WAREHOUSE_ID, RANK, GUID )
  VALUES (10, 10, 1, 10, 'SHOP10_Main' );

INSERT INTO TSHOPURL (STOREURL_ID, SHOP_ID, URL, GUID )  VALUES (10, 10, 'testdevshop.yes-cart.org', 'SHOP10_10');
INSERT INTO TSHOPURL (STOREURL_ID, SHOP_ID, URL, GUID )  VALUES (11, 10, 'www.testdevshop.yes-cart.org', 'SHOP10_11');
INSERT INTO TSHOPURL (STOREURL_ID, SHOP_ID, URL, GUID )  VALUES (12, 10, 'localhost', 'SHOP10_12');

INSERT INTO TCATEGORY(CATEGORY_ID, PARENT_ID, RANK, NAME, DESCRIPTION, UITEMPLATE, GUID) VALUES (100, 100, 0, 'root', 'Master category','default', '100');

INSERT INTO TCATEGORYATTRVALUE(ATTRVALUE_ID, CODE,VAL, CATEGORY_ID, GUID) VALUES (9000,'PRODUCT_IMAGE_WIDTH','280',100,'9000_CAV');
INSERT INTO TCATEGORYATTRVALUE(ATTRVALUE_ID, CODE,VAL, CATEGORY_ID, GUID) VALUES (9001,'PRODUCT_IMAGE_HEIGHT','280',100,'9001_CAV');
INSERT INTO TCATEGORYATTRVALUE(ATTRVALUE_ID, CODE,VAL, CATEGORY_ID, GUID) VALUES (9002,'PRODUCT_IMAGE_TUMB_WIDTH','80',100,'9002_CAV');
INSERT INTO TCATEGORYATTRVALUE(ATTRVALUE_ID, CODE,VAL, CATEGORY_ID, GUID) VALUES (9003,'PRODUCT_IMAGE_TUMB_HEIGHT','80',100,'9003_CAV');

INSERT INTO TCATEGORYATTRVALUE(ATTRVALUE_ID, CODE,VAL, CATEGORY_ID, GUID) VALUES (9004,'CATEGORY_IMAGE_WIDTH','80',100,'9004_CAV');
INSERT INTO TCATEGORYATTRVALUE(ATTRVALUE_ID, CODE,VAL, CATEGORY_ID, GUID) VALUES (9005,'CATEGORY_IMAGE_HEIGHT','80',100,'9005_CAV');


INSERT INTO TROLE (ROLE_ID, GUID, CODE, DESCRIPTION) VALUES (1, 'ROLE_SMADMIN',         'ROLE_SMADMIN', 'System admin');
INSERT INTO TROLE (ROLE_ID, GUID, CODE, DESCRIPTION) VALUES (2, 'ROLE_SMSHOPADMIN',     'ROLE_SMSHOPADMIN', 'Shop manager');
INSERT INTO TROLE (ROLE_ID, GUID, CODE, DESCRIPTION) VALUES (3, 'ROLE_SMWAREHOUSEADMIN','ROLE_SMWAREHOUSEADMIN', 'Inventory manager');
INSERT INTO TROLE (ROLE_ID, GUID, CODE, DESCRIPTION) VALUES (4, 'ROLE_SMCALLCENTER',    'ROLE_SMCALLCENTER', 'Call centre operator');

-- default admin password 1234567
INSERT INTO TMANAGER (GUID, MANAGER_ID, EMAIL, FIRSTNAME, LASTNAME, PASSWORD) VALUES ('YCADMIN', 1, 'admin@yes-cart.com', 'Yes', 'Admin', 'fcea920f7412b5da7be0cf42b8c93759');

INSERT INTO TMANAGERROLE (MANAGERROLE_ID, EMAIL, CODE, GUID) VALUES (1, 'admin@yes-cart.com', 'ROLE_SMADMIN', 'YCADMIN_ROLE');

INSERT INTO HIBERNATE_UNIQUE_KEYS VALUES (100000);

COMMIT;