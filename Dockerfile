FROM quay.io/jupyter/r-notebook:2024-12-23

# Configure environment
ENV DOCKER_IMAGE_NAME='hlatyping-env'
ENV VERSION='2025-01-24' 

#RUN git clone https://github.com/RabadanLab/arcasHLA.git /home/jovyan/arcasHLA
RUN git clone https://github.com/jboktor/arcasHLA.git /home/jovyan/arcasHLA

RUN conda env create -f /home/jovyan/arcasHLA/environment.yml

# Activate the environment and install Jupyter and ipykernel in the same RUN command
RUN conda run -n arcas-hla conda install -y jupyter \
    && conda run -n arcas-hla conda install -y ipykernel \
    && conda run -n arcas-hla python -m ipykernel install --user --name=arcasHLA --display-name "Python (arcasHLA)"

# Update the IPD-IMGT/HLA database to the latest version
RUN conda run -n arcas-hla /home/jovyan/arcasHLA/arcasHLA reference --update

# Add README file
COPY README.ipynb /home/jovyan/

# Remove work directory
RUN rm -r /home/jovyan/work

# activate arcas-hla environment at startup
RUN echo "source activate arcas-hla" > ~/.bashrc
