package ptithcm.entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
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
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="Products")
public class Product implements Serializable{
	@Id
	@NotBlank(message="Không được để trống Product ID")
	private String productId;
	@NotBlank(message="Không được để trống tên sản phẩm")
	private String name;
	@NotNull(message="Không được để trống đơn giá")
	private Float unitPrice;
	private Integer quantity;
	private Float discount;
//	String categoryId;
	private String donViTinh;
	private String photo;
	private String description;
	private String specification;
	private Integer viewCount;
	@NotNull(message="Không được để trống tình trạng đặc biệt")
	private Boolean special;
	@NotNull(message="Không được để trống ngày tháng của mặt hàng")
	@Past(message="Không được chọn ngày trong tương lai")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="dd/MM/yyyy")
	private Date dateIn;
	@NotNull(message="Không được để trống tình trạng hàng")
	private Boolean available;

	@ManyToOne
	@JoinColumn(name="categoryId")
	private Category category;
	
	@OneToMany(mappedBy="product", fetch=FetchType.EAGER)
	private Collection<OrderDetail> orderDetail;

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(String productId, String name, Float unitPrice, Integer quantity, Float discount, String donViTinh,
			String photo, String description, String specification, Integer viewCount, Boolean special, Date dateIn,
			Boolean available, Category category, Collection<OrderDetail> orderDetail) {
		super();
		this.productId = productId;
		this.name = name;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
		this.discount = discount;
		this.donViTinh = donViTinh;
		this.photo = photo;
		this.description = description;
		this.specification = specification;
		this.viewCount = viewCount;
		this.special = special;
		this.dateIn = dateIn;
		this.available = available;
		this.category = category;
		this.orderDetail = orderDetail;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getDateIn() {
		return dateIn;
	}

	public void setDateIn(Date dateIn) {
		this.dateIn = dateIn;
	}

	public Float getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Float unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Float getDiscount() {
		return discount;
	}

	public void setDiscount(Float discount) {
		this.discount = discount;
	}

	public String getDonViTinh() {
		return donViTinh;
	}

	public void setDonViTinh(String donViTinh) {
		this.donViTinh = donViTinh;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
	}

	public Integer getViewCount() {
		return viewCount;
	}

	public void setViewCount(Integer viewCount) {
		this.viewCount = viewCount;
	}

	public Boolean getSpecial() {
		return special;
	}

	public void setSpecial(Boolean special) {
		this.special = special;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Collection<OrderDetail> getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(Collection<OrderDetail> orderDetail) {
		this.orderDetail = orderDetail;
	}

	public Boolean getAvailable() {
		return available;
	}

	public void setAvailable(Boolean available) {
		this.available = available;
	}
}
