# 🌩️ Cloud Resume Challenge — Azure Edition (CI/CD + Terraform + CosmosDB)

Hi, I’m **Vithushan Visuvalingam**, an aspiring Cloud Engineer. This project is my advanced take on the [Cloud Resume Challenge](https://cloudresumechallenge.dev/) — fully built on **Microsoft Azure**, with a focus on **infrastructure as code**, **CI/CD automation**, and **serverless architecture**.

---

# 📌 Live Demo

🔗 [Live Site](https://vithustorageterra.z9.web.core.windows.net)  
👁️ Visit Counter powered by Azure Function + Cosmos DB

---

# 🚀 Project Highlights

| Feature                          | Tech Stack                                   |
|----------------------------------|-----------------------------------------------|
| **Static Website Hosting**       | Azure Blob Storage + Static Website           |
| **Visit Counter Backend**        | Azure Functions (Python), Cosmos DB           |
| **CI/CD Pipelines**              | GitHub Actions for Infra + Code Deployments   |
| **Infra as Code**                | Terraform                                     |
| **Monitoring**                   | Application Insights                          |
| **Secure Secrets**               | GitHub Secrets, Sensitive Variables in TF     |

---

# 🛠️ Technologies Used

- **Azure Services:** Blob Storage, Cosmos DB, Functions, App Insights, Resource Groups, Storage Accounts
- **DevOps:** GitHub Actions, Terraform, CI/CD Pipelines
- **Languages:** Python, HTML, CSS, JavaScript
- **Tools:** VS Code, Azure CLI, Git, Terraform CLI

---

# 📂 Project Structure

terraform-cloud-challenge/
│
├── terraform/ # All IaC for Azure Resources
│ ├── main.tf
│ ├── variables.tf
│ ├── terraform.tfvars # Contains secrets (gitignored)
│
├── backend/
│ └── visitor-counter-func/ # Azure Function (Python)
│ ├── init.py
│ ├── function.json
│ ├── host.json
│
├── frontend/
│ ├── index.html # Static Resume Site
│ ├── style.css
│ └── main.js
│
├── .github/
│ └── workflows/ # CI/CD workflows
│ ├── terraform.yml
│ ├── functionapp.yml
│ └── staticsite.yml


---

# 🧠 Lessons Learned

- Deep understanding of Terraform state locking, modules, and secure secrets
- Troubleshooting real-world GitHub push protection and Azure resource conflicts
- CI/CD pipelines for multi-part deployment (infra + backend + frontend)

---

# 🎯 Next Steps

- Migrate to Bicep for comparison with Terraform
- Add testing framework for Function App
- Track analytics via App Insights queries

---

# 🤝 Connect with Me

🔗 [LinkedIn](https://linkedin.com/in/vithushan-visuvalingam-3aa0611b8)  
📧 vithushanvisuvalingam@email.com  
💻 [GitHub](https://github.com/CloudWithVithu)

---

🛡️ Built with 💙 on Azure | Powered by Terraform | CI/CD with GitHub Actions
