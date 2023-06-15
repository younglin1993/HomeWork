<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.younglin.homework.model.entity.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home Work</title>
	<style>
		table{
			border:1px solid black;
		}
		
		th,td {
			padding:10px;
			border:1px solid black;
		}
	</style>
</head>
<body>
	<div class="container">
		<div class="search-container">
			<input type="text" id="search-input">
			<button id="search-btn">搜尋</button>
		</div>
		
		<div class="search-results">
			<table>
				<thead>
					<tr>
						<th>product_id</th>
						<th>name</th>
						<th>product_type</th>
						<th>price</th>
						<th>stock</th>
					</tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>
		</div>
	</div>
	<script>
		const btn  = document.getElementById('search-btn');
		const input = document.getElementById('search-input');
		
		btn.addEventListener('click', function() {
			const searchText = input.value;
			searchProduct(searchText);
		});
		
		function searchProduct(searchText) {
			  const url = './search?searchText=' + searchText;

			  const xhr = new XMLHttpRequest();
			  xhr.open('GET', url, true);
			  xhr.onreadystatechange = function() {
			    if (xhr.readyState === XMLHttpRequest.DONE) {
			      if (xhr.status === 200) {
			        const response = JSON.parse(xhr.responseText);
			        displaySearchResults(response);
			      } else {
			        console.error('搜尋請求失敗');
			      }
			    }
			  };
			  xhr.send();
		}
		
		function displaySearchResults(results) {
			  const searchResults = document.getElementsByClassName('search-results')[0];
			  const tbody = searchResults.querySelector('tbody');
			  
			  tbody.innerHTML = '';
			  
			  for (const result of results) {
				    const tr = document.createElement('tr');

				    const productIdTd = document.createElement('td');
				    productIdTd.textContent = result.productId;
				    tr.appendChild(productIdTd);

				    const nameTd = document.createElement('td');
				    nameTd.textContent = result.name;
				    tr.appendChild(nameTd);

				    const productTypeTd = document.createElement('td');
				    productTypeTd.textContent = result.productType;
				    tr.appendChild(productTypeTd);

				    const priceTd = document.createElement('td');
				    priceTd.textContent = result.price;
				    tr.appendChild(priceTd);

				    const stockTd = document.createElement('td');
				    stockTd.textContent = result.stock;
				    tr.appendChild(stockTd);

				    tbody.appendChild(tr);
				  }
		}

	</script>
</body>
</html>