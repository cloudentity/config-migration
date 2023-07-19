# config-migration

Example implementation of automatic workspace configuration promotion between 2 tenants using:
`https://cloudentity.com/developers/api/authorization_apis/hub-api/#tag/configuration`

Learn more:

- [Automated Cloudentity Configuration Management](https://cloudentity.com/developers/howtos/tenant-configuration/automated-configuration-management/)
- [Exporting, Importing and Patching Cloudentity Tenant/Workspace Configuration](https://cloudentity.com/developers/howtos/tenant-configuration/configuration-export-and-patching/)
- [Cloudentity Configuration Promotion](https://cloudentity.com/developers/howtos/tenant-configuration/configuration-promotion/)

## Prerequisities

1. Sign-up for an account on `https://cloudentity.com/`
2. Create 2 tenants, one for higher environment (production) and one for lower environment (development)
3. Create a workspace in production tenant
4. Create 2 clients in system workspace that will be used for migration, one for each tenant. Clients should have configured `manage_configuration` scope.

## Configuration

1. Clone this repository.
2. Set Github variables for your Github repository, i.e:

```bash
CLOUDENTITY_PROD_MIGRATIONDEV_SYSTEM_CID=client_id
CLOUDENTITY_PROD_MIGRATIONDEV_SYSTEM_CS=client_secret
CLOUDENTITY_PROD_MIGRATIONDEV_URL=devtenant.us.authz.cloudentity.io
CLOUDENTITY_PROD_MIGRATIONDEV_TENANT=devtenant
CLOUDENTITY_PROD_MIGRATIONDEV_WORKSPACE=devworkspace

CLOUDENTITY_PROD_MIGRATIONPROD_SYSTEM_CID=client_id
CLOUDENTITY_PROD_MIGRATIONPROD_SYSTEM_CS=client_secret
CLOUDENTITY_PROD_MIGRATIONPROD_URL=prodtenant.us.authz.cloudentity.io
CLOUDENTITY_PROD_MIGRATIONPROD_TENANT=prodtenant
CLOUDENTITY_PROD_MIGRATIONPROD_WORKSPACE=prodworkspace
```

## Usage

1. Run `create PR - patch prod compare dev to dev` Github action to create PR with patch of configuration from 2 recent dumps of dev workspace.
2. Review and merge PR.
3. Run `push config - patch prod compare dev to dev` to apply changes to prod workspace.
