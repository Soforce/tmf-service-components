/** 
 * TMForum ProductOrder entity classes
 * @author Justin Yue
 */
public virtual class TMFProductOrderEntity extends TMFEntity {
    public enum ProductOrderStateType { Acknowledged, Rejected, Pending, Held, InProgress, Cancelled, Completed, Failed, Partial, AssessingCancellation, PendingCancellation }
    /**
     * A Product Order is a type of order which can be used to place an order between a customer and a service provider or 
     * between a service provider and a partner and vice versa,
     */
    public class ProductOrder {
        // Unique identifier of the product order
        public String id;
        // A date time (DateTime). Date when the order is cancelled. This is used when order is cancelled.
        public Datetime cancellationDate;
        // A string. Reason why the order is cancelled. This is used when order is cancelled.
        public String cancellationReason;
        // Used to categorize the order from a business perspective that can be useful for the OM system (e.g. "enterprise", "residential", ...)
        public String category;
        // Date when the order was completed.
        public Datetime completionDate;
        // Description of the product order.
        public String description;
        // Expected delivery date amended by the provider.
        public Datetime expectedCompletionDate;
        // ID given by the consumer and only understandable by him (to facilitate his searches afterwards). 
        public String externalId;
        // Contact attached to the order to send back information regarding this order
        public String notificationContact;
        // Date when the order was created.
        public Datetime orderDate;
        // A way that can be used by consumers to prioritize orders in OM system (from 0 to 4 : 0 is the highest priority, and 4 the lowest)
        public String priority;
        // Requested delivery date from the requestor perspective.
        public Datetime requestedCompletionDate;
        // Order fulfillment start date wished by the requestor. This is used when, for any reason, requestor cannot allow seller to begin to operationally begin the fulfillment before a date.
        public Datetime requestedStartDate;
        // A list of agreement references (AgreementRef [*]).
        public AgreementRef[] agreement;
        // A billing account reference (BillingAccountRef).
        public BillingAccountRef billingAccount;
        // A list of related channels (RelatedChannel [*]). Related channel to another entity. May be online web, mobile app, social ,etc.
        public RelatedChannel[] channel;
        // Extra information about a given entity
        public Note[] note;
        // A list of order prices (OrderPrice [*]). An amount, usually of money, that represents the actual price paid by the Customer for this item or this order.
        public OrderPrice[] orderTotalPrice;
        // A list of payment references (PaymentRef [*]). If an immediate payment has been done at the product order submission, the payment information are captured and stored (as a reference) in the order.
        public PaymentRef[] payment;
        // It's a productOfferingQualification that has been executed previously
        public ProductOfferingQualificationRef[] productOfferingQualification;
        // A list of product order items (ProductOrderItem [1..*]). An identified part of the order. A product order is decomposed into one or more order items.
        public ProductOrderItem[] productOrderItem;
        // A list of quote references (QuoteRef [*]).
        public QuoteRef[] quote;
        // A list of related parties (RelatedParty [*]).
        public RelatedParty[] relatedParty;
        // A product order state type (ProductOrderStateType).
        public ProductOrderStateType state;
    }

    /**
     * ProductOrderItem Relationship
     */
    public class OrderItemRelationship extends EntityRelationship { }
    /**
     * Description of a productTerm linked to this orderItem. This represent a commitment with a duration
     */
    public class OrderTerm {
        // Name of the productOrderTerm
        public String name;
        // Description of the productOrderTerm
        public String description;
        // An amount in a given unit
        public Quantity duration;
    }
    /**
     * @description An identified part of the order. A product order is decomposed into one or more order items.
     */
    public class ProductOrderItem {
        // Unique identifier of the order item
        public String id;
        // Number of units ordered. Supported by the root order item that represents a newly provided non-serialized product offering.
        public Integer quantity;
        // An order item action type (ItemActionType). The action to be carried out on the Product. Can be: add, modify, delete, noChange.
        public ItemActionType action;
        // Refers an appointment, such as a Customer presentation or internal meeting or site visit
        public AppointmentRef appointment;
        // BillingAccount reference.
        public BillingAccountRef billingAccount;
        // A list of order prices (OrderPrice [*]). An amount, usually of money, that represents the actual price paid by the Customer for this item or this order.
        public OrderPrice[] itemPrice;
        // A list of order prices (OrderPrice [*]). An amount, usually of money, that represents the actual price paid by the Customer for this item or this order.
        public OrderPrice[] itemTotalPrice;
        // Description of a productTerm linked to this orderItem. This represent a commitment with a duration
        public OrderTerm[] itemTerm;
        // A list of payment references (PaymentRef [*]). If an immediate payment has been done at the product order submission, the payment information are captured and stored (as a reference) in the order.
        public PaymentRef[] payment;
        // A product ref or value (ProductRefOrValue). A product to be created defined by value or existing defined by reference. The polymorphic attributes @type, @schemaLocation & @referredType are related to the product entity and not the RelatedProductRefOrValue class itself.
        public ProductRefOrValue product;

        // A product offering reference (ProductOfferingRef). A product offering represents entities that are orderable from the provider of the catalog, this resource includes pricing information.
        public ProductOfferingRef productOffering;

        // It's a productOfferingQualification item that has been executed previously.
        public ProductOfferingQualificationItemRef productOfferingQualificationItem;
        // A list of product order items (ProductOrderItem [*]). An identified part of the order. A product order is decomposed into one or more order items.
        public ProductOrderItem[] productOrderItem;
        // A list of order item relationships (OrderItemRelationship [*]).
        public OrderItemRelationship[] productOrderItemRelationship;
        // A quote item reference (QuoteItemRef). It's a Quote item that has been executed previously.
        public QuoteItemRef quoteItem;
        // A product order item state type (ProductOrderItemStateType). State of the order item : described in the state machine diagram.
        public ProductOrderStateType state;
    }    
   

    /**
     * An amount, usually of money, that represents the actual price paid by the Customer for this item or this order
     */
    public class OrderPrice extends EntityPrice { 
        // A billing account reference (BillingAccountRef).
        public BillingAccountRef billingAccount;

    }    
}