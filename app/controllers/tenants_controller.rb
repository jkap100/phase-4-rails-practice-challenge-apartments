class TenantsController < ApplicationController

    before_action :find_tenant, except: [:index, :create]

    def index
        render json: Tenant.all
    end

    def show
        render json: @tenant
    end

    def create
        tenant = Tenant.create!(tenant_params)
        render json: tenant, status: :created
    end

    def update
        @tenant.update(tenant_params)
        render json: @tenant, status: :created
    end

    def destroy
        @tenant.destroy
        head :no_content
    end

    private

    def find_tenant
        @tenant = Tenant.find(params[:id])
    end

    def tenant_params
        params.permit(:name, :age)
    end

end
