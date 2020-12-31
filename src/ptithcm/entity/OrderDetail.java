package ptithcm.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="OrderDetails")
public class OrderDetail implements Serializable{
	@EmbeddedId
	private OrderDetailID orderDetailID;
	
	private Integer quantityOrder ;	
	private Float unitPrice;
	private Float discount;

	@Embeddable
	public static class OrderDetailID implements Serializable{
		private static final long serialVersionUID = 1L;
		@Column(name = "OrderID")
		private Long orderId	;
		@Column(name = "productID")
		private String productId ;
		public Long getOrderId() {
			return orderId;
		}
		public void setOrderId(Long orderId) {
			this.orderId = orderId;
		}
		public String getProductId() {
			return productId;
		}
		public void setProductId(String productId) {
			this.productId = productId;
		}
	}

	@ManyToOne
	@JoinColumn(name="orderId", insertable = false, updatable = false)
	private CustomerOrder customOrder;
	
	@ManyToOne
	@JoinColumn(name="productId", insertable = false, updatable = false)
	private Product product;

	public OrderDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CustomerOrder getCustomOrder() {
		return customOrder;
	}

	public OrderDetail(OrderDetailID orderDetailID, Integer quantityOrder, Float unitPrice, Float discount,
		CustomerOrder customOrder, Product product) {
	super();
	this.orderDetailID = orderDetailID;
	this.quantityOrder = quantityOrder;
	this.unitPrice = unitPrice;
	this.discount = discount;
	this.customOrder = customOrder;
	this.product = product;
}

	public void setCustomOrder(CustomerOrder customOrder) {
		this.customOrder = customOrder;
	}

	public Integer getQuantityOrder() {
		return quantityOrder;
	}

	public void setQuantityOrder(Integer quantityOrder) {
		this.quantityOrder = quantityOrder;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Float getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Float unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Float getDiscount() {
		return discount;
	}

	public void setDiscount(Float discount) {
		this.discount = discount;
	}

	public OrderDetailID getOrderDetailID() {
		return orderDetailID;
	}

	public void setOrderDetailID(OrderDetailID orderDetailID) {
		this.orderDetailID = orderDetailID;
	}
}