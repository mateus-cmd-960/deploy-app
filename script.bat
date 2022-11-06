echo "criando as imagens............."

docker build -t mateusabel/projecto-backend:1.0 backend/.
docker build -t mateusabel/projecto-database:1.0 database/.

echo "realizando o push das imagens...."

docker push mateusabel/projecto-backend:1.0
docker push mateusabel/projecto-database:1.0

echo "criando servicos no cluster Kubernetes"

kubectl apply -f ./services.yml

echo "criando o deployment...."
kubectl apply -f ./deployment.yml