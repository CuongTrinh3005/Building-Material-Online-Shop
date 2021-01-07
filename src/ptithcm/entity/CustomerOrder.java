package ptithcm.entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="CustomOrders")
public class CustomerOrder implements Serializable{
	@Id @GeneratedValue
	private Long orderId	;
	
	@NotNull(message="Không được để trống ngày tháng của mặt hàng")
	@Past(message="Không được chọn ngày trong tương lai")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="dd/MM/yyyy")
	private Date orderDate	;
	@NotBlank(message="Không được để trống nơi giao hàng")
	private String address;
	private String description;
//	private String customerId;
	
	@OneToMany(mappedBy="customOrder", fetch=FetchType.EAGER)
	private Collection<OrderDetail> orderDetail;
	
	@ManyToOne
	@JoinColumn(name="customerId")
	private Customer customer;
	public CustomerOrder() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CustomerOrder(Long orderId, Date orderDate, String address, String description,
			Collection<OrderDetail> orderDetail, Customer customer) {
		super();
		this.orderId = orderId;
		this.orderDate = orderDate;
		this.address = address;
		this.description = description;
		this.orderDetail = orderDetail;
		this.customer = customer;
	}

	public Collection<OrderDetail> getOrderDetail() {
		return orderDetail;
	}
	public void setOrderDetail(Collection<OrderDetail> orderDetail) {
		this.orderDetail = orderDetail;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
