/**
 * TMF 648 - Quote Management (Customer APIs)
 * 
 * A Quote is created based on product offering(s) that is(are) defined in a catalog. The quote identifies the product or set of products that are available to a customer for pricing request, 
 * and includes product characteristics.
 * The Quote references the product offer(s) which (future) customer request pricing. Quote resource features authorization subclass to manage special pricing UC requiring authorization tracking management.
 * 
 * A Quote can be used to request pricing between a customer and a service provider or between a service provider and a partner and vice versa. Main quote attributes are its identifier, state, priority, 
 * related dates (requested, expected, valid, completion, etc.), related parties and quote items. Main Quote Items attributes are the discribed offering and product characteristics with the related 
 * action to be performed (e.g. add, change or delete the products), location information, and product characteristics.
 */
public virtual class TMFQuoteEntity extends TMFEntity {
    public enum QuoteStateType { Acknowledged, Rejected, Pending, InProgress, Cancelled, Approved, Accepted, Declined }

    /**
     * An amount, usually of money, that represents the actual price paid by the Customer for this item or this order
     */
    public class QuotePrice extends EntityPrice { }    
    
    /**
     * Quote can be used to negotiate service and product acquisition or modification between a customer and a service provider. Quote contain list of quote items, a reference to customer (partyRole), 
     * a list of productOffering and attached prices and conditions.
     */
    public virtual class Quote {
        // Unique identifier of the Quote
        public String id;
        // A list of agreement references (AgreementRef [*]).
        public AgreementRef[] agreement;
        // A billing account reference (BillingAccountRef).
        public BillingAccountRef billingAccount;
        // Used to categorize the order from a business perspective that can be useful for the OM system (e.g. "enterprise", "residential", ...)
        public String category;
        // Indicates the contact medium that could be used to contact the party.
        public ContactMedium[] contactMedium;
        // Description of the Quote.
        public String description;
        // This is the date wished by the requester to have the requested quote item delivered.
        public Datetime expectedFulfillmentStartDate;
        // This is expected date - from quote supplier - to be able to send back a response for this quote
        public Datetime expectedQuoteCompletionDate;
        // ID given by the consumer and only understandable by him (to facilitate his searches afterwards).
        public ExternalIdentifier[] externalId;
        // An indicator which when the value is "true" means that requester expects to get quoting result immediately in the response. 
        // If the indicator is true then the response code of 200 indicates the operation is successful otherwise a task is created with a response 201.
        public Boolean instantSyncQuote;
        // Extra information about a given entity
        public Note[] note;
        // An authorization provided for the quote
        public Authorization[] authorization;
        // Quote total price
        public QuotePrice[] quoteTotalPrice;
        // A reference to a party playing a role in this quote (customer, seller, requester, etc.)
        public RelatedPartyRefOrPartyRoleRef[] relatedParty;
        // It's a productOfferingQualification that has been executed previously
        public ProductOfferingQualificationRef[] productOfferingQualification;
        // This is requested date - from quote requester - to get a complete response for this quote
        public Datetime requestedQuoteCompletionDate;
        // A Quote state type (QuoteStateType).
        public QuoteStateType state;        
        // Date and time when the quote was created
        public Datetime creationDate;
        // Date when the quote has been completed
        public Datetime effectiveQuoteCompletionDate;
        // A period of time, either as a deadline (endDateTime only) a startDateTime only, or both
        public TimePeriod validFor;
        // Quote version - if the customer rejected the quote but negotiations still open a new version of the quote is managed
        public String version;
        // A quote items describe an action to be performed on a productOffering or a product in order to get pricing elements and condition.
        public QuoteItem[] quoteItem;
    }

    /**
     * The quote items describe an action to be performed on a productOffering or a product in order to get pricing elements and condition.
     */
    public class QuoteItem {
        // Unique identifier of the quote item
        public String id;
        // Number of units quoteed. Supported by the root quote item that represents a newly provided non-serialized product offering.
        public Integer quantity;
        // An quote item action type (ItemActionType). The action to be carried out on the Product. Can be: add, modify, delete, noChange.
        public ItemActionType action;
        // A reference to appointment(s) associated with this quote item
        public AppointmentRef[] appointment;
        // A reference to attachment(s) associated with this quote item
        public AttachmentRefOrValue[] attachment;
        // Free form text associated with the quote item
        public Note[] note;
        // A product ref or value (ProductRefOrValue). A product to be created defined by value or existing defined by reference. The polymorphic attributes @type, @schemaLocation & @referredType are related to the product entity and not the RelatedProductRefOrValue class itself.
        public ProductRefOrValue product;
        // A product offering reference (ProductOfferingRef). A product offering represents entities that are Quoteable from the provider of the catalog, this resource includes pricing information.
        public ProductOfferingRef productOffering;
        // A list of quote items (QuoteItem [*]). An identified part of the Quote. A product Quote is decomposed into one or more Quote items.
        public QuoteItem[] quoteItem;
        // An authorization provided for the quote item
        public Authorization[] quoteItemAuthorization;
        // Price for this quote item
        public QuotePrice[] itemPrice;
        // A list of quote prices (QuotePrice [*]). An amount, usually of money, that represents the actual price paid by the Customer for this item or this Quote.
        public QuotePrice[] itemTotalPrice;
        // A list of Quote item relationships (QuoteItemRelationship [*]).
        public QuoteItemRelationship[] quoteItemRelationship;
        // It's a productOfferingQualification item that has been executed previously.
        public ProductOfferingQualificationItemRef productOfferingQualificationItem;
        // A quote item state type (ProductQuoteItemStateType). State of the Quote item : described in the state machine diagram.
        public QuoteStateType state;
        // A reference to a party playing a role in this quote (customer, seller, requester, etc.)
        public RelatedPartyRefOrPartyRoleRef[] relatedParty;
    }

    
    /**
     * QuoteItem Relationship
     */
    public class QuoteItemRelationship extends EntityRelationship { }
}