package ptithcm.entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name="Categories")
public class Category implements  Serializable{
	@Id
	@NotBlank(message="Không được để trống Category Id")
	private String categoryId;	
	@NotBlank(message="Không được để trống tên loại sản phẩm")
	private String name	;
	
	@OneToMany(mappedBy="category", fetch=FetchType.EAGER)
	private Collection<Product> products;

	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Category(String categoryId, String name, List<Product> products) {
		super();
		this.categoryId = categoryId;
		this.name = name;
		this.products = products;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Collection<Product> getProducts() {
		return products;
	}

	public void setProducts(Collection<Product> products) {
		this.products = products;
	}
	
	
}
