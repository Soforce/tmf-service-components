/** 
 * TMF - 663 Shopping Cart 
 * The Shoppoing Cart API provides a standardized mechanism for the management of shopping carts. Including creation, update, retrieval, deletion 
 * and notification of event. Shopping Cart entity is used for the temporarily selection and reservation of product offerings in e-commerce and retail purchase. 
 * Shopping cart supports purchase of both tangible and intangible goods and service (e.g. handset, telecom network service). The charge includes a one-off fee 
 * such as fee for handset and recurring fee such as fee of a network service. Shopping Cart contains list of cart items, a reference to party or party role 
 * (e.g. customer) or contact medium in case of unknown customer, In addition the calculated items total price including promotions.
 * @author Justin Yue
 */
public virtual class TMFShoppingCartEntity extends TMFEntity {
    public enum CartItemStatusType { Active, SaveForLater }
    /**
     * Shopping Cart resource is used for the temporarily selection and reservation of product offerings in e-commerce, call center and retail purchase. 
     * Shopping cart supports purchase of both physical and digital goods and service (e.g. handset, telecom network service). 
     * Shopping Cart contain list of cart items, a reference to customer (partyRole) or contact medium in case customer not exist, 
     * and the total items price including promotions
     */
    public class ShoppingCart {
        // unique identifier
        public String id;
        // A period of time, either as a deadline (endDateTime only) a startDateTime only, or both
        public TimePeriod validFor;
        // Indicates the contact medium that could be used to contact the party.
        public ContactMedium[] contactMedium;
        // Total amount of the shopping cart, usually of money, that represents the actual price paid by the Customer for cart (considering only "Active" cart items)
        public CartPrice[] cartTotalPrice;
        // An identified part of the shopping cart. A shopping cart is decomposed into one or more shopping cart item. Cart item represents a product offering or 
        // bundled product offering that user wish to purchase, as well as the pricing of the product offering, reference to product in case of configured 
        // characteristic or installation address. Cart items can be related to other cart item to related bundled offerings or reference cart Items to a 
        // shipping options
        public CartItem[] cartItem;
        // RelatedParty reference. A related party defines party or party role or its reference, linked to a specific entity
        public RelatedParty[] relatedParty;
        // The date on which the shopping cart was created
        public Datetime creationDate;
        // The date and time that the shopping cart was last updated
        public Datetime lastUpdate;

    }

    /**
     * 	Total amount of the shopping cart, usually of money, that represents the actual price paid by the Customer for cart (considering only "Active" cart items)
     */
    public class CartPrice extends EntityPrice { }    

    /**
     * CartItemRelationship Relationship
     */
    public class CartItemRelationship extends EntityRelationship { }

    /**
     * Description of a productTerm linked to this orderItem. This represent a commitment with a duration
     */
    public class CartTerm {
        // Name of the CartTerm
        public String name;
        // Description of the CartTerm
        public String description;
        // An amount in a given unit
        public Quantity duration;
    }

    /**
     * An identified part of the shopping cart. A shopping cart is decomposed into one or more shopping cart item. Cart item represents a product offering or 
     * bundled product offering that user wish to purchase, as well as the pricing of the product offering, reference to product in case of configured 
     * characteristic or installation address. Cart items can be related to other cart item to related bundled offerings or reference cart Items to a shipping options
     */
    public class CartItem {
        // Unique identifier of the order item
        public String id;
        // Number of units ordered. Supported by the root order item that represents a newly provided non-serialized product offering.
        public Integer quantity;
        // An order item action type (OrderItemActionType). The action to be carried out on the Product. Can be: add, modify, delete, noChange.
        public ItemActionType action;
        // Possible values for the status of the cart item, saveForLater items are not calculated in the cart prices
        public CartItemStatusType state;
        // // BillingAccount reference.
        // public BillingAccountRef billingAccount;
        // An amount, usually of money, that represents the actual price paid by the Customer for this item or this cart.
        public CartPrice[] itemPrice;
        // An amount, usually of money, that represents the actual price paid by the Customer for this item or this cart.
        public CartPrice[] itemTotalPrice;
        // Description of a productTerm linked to this orderItem. This represent a commitment with a duration
        public CartTerm[] itemTerm;
        // Extra information about a given item
        public Note[] note;
        // A product ref or value (ProductRefOrValue). A product to be created defined by value or existing defined by reference. The polymorphic attributes @type, @schemaLocation & @referredType are related to the product entity and not the RelatedProductRefOrValue class itself.
        public ProductRefOrValue product;
        // A product offering reference (ProductOfferingRef). A product offering represents entities that are orderable from the provider of the catalog, this resource includes pricing information.
        public ProductOfferingRef productOffering;
        // A list cart items. 
        public CartItem[] cartItem;
        // Relationship among cart items mainly other than hierarchical relationships such as "relyOn", "dependentOn", "shipping" etc.
        public CartItemRelationship[] cartItemRelationship;
    }
}