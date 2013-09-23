/*
 * Copyright 2009 Igor Azarnyi, Denys Pavlov
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the License is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the License for the specific language governing permissions and
 *    limitations under the License.
 */

package org.yes.cart.remote.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.yes.cart.domain.dto.ProductCategoryDTO;
import org.yes.cart.exception.UnableToCreateInstanceException;
import org.yes.cart.exception.UnmappedInterfaceException;
import org.yes.cart.remote.service.ReindexService;
import org.yes.cart.remote.service.RemoteBackdoorService;
import org.yes.cart.remote.service.RemoteProductCategoryService;
import org.yes.cart.service.async.model.AsyncContext;
import org.yes.cart.service.domain.SystemService;
import org.yes.cart.service.dto.DtoProductCategoryService;
import org.yes.cart.web.service.ws.client.AsyncFlexContextImpl;

import java.util.HashMap;
import java.util.Map;

/**
 * User: Igor Azarny iazarny@yahoo.com
 * Date: 15-May-2011
 * Time: 17:22:15
 */
public class RemoteProductCategoryServiceImpl
        extends AbstractRemoteService<ProductCategoryDTO>
        implements RemoteProductCategoryService {

    private static final Logger LOG = LoggerFactory.getLogger( RemoteProductCategoryServiceImpl.class );


    private final ReindexService reindexService;

    private final RemoteBackdoorService remoteBackdoorService;

    private final SystemService systemService;



    /**
     * Construct remote service.
     *
     * @param dtoProductCategoryService dto service to use.
     * @param reindexService            product reindex service
     * @param systemService             system service
     */
    public RemoteProductCategoryServiceImpl(
            final DtoProductCategoryService dtoProductCategoryService,
            final ReindexService reindexService,
            final RemoteBackdoorService remoteBackdoorService,
            final SystemService systemService) {
        super(dtoProductCategoryService);
        this.reindexService = reindexService;
        this.remoteBackdoorService = remoteBackdoorService;
        this.systemService = systemService;
    }


    /**
     * {@inheritDoc}
     */
    public void removeByCategoryProductIds(final long categoryId, final long productId) {
        ((DtoProductCategoryService) getGenericDTOService()).removeByCategoryProductIds(categoryId, productId);
        reindexService.reindexProduct(productId);
    }

    /**
     * {@inheritDoc}
     */
    public void removeByProductIds(final long productId) {
        ((DtoProductCategoryService) getGenericDTOService()).removeByProductIds(productId);
        reindexService.reindexProduct(productId);
    }

    /**
     * {@inheritDoc}
     */
    public int getNextRank(final long categoryId) {
        return ((DtoProductCategoryService) getGenericDTOService()).getNextRank(categoryId);
    }

    /**
     * {@inheritDoc}
     */
    public ProductCategoryDTO create(ProductCategoryDTO instance) throws UnmappedInterfaceException, UnableToCreateInstanceException {
        if (!isAssignedCategoryProductIds(instance.getCategoryId(), instance.getProductId())) {
            ProductCategoryDTO rez = super.create(instance);
            reindexService.reindexProduct(rez.getProductId());
            return rez;
        }

        throw new UnableToCreateInstanceException("Product Already assigned to this category ", null);

    }

    /**
     * {@inheritDoc}
     */
    public ProductCategoryDTO update(ProductCategoryDTO instance) throws UnmappedInterfaceException, UnableToCreateInstanceException {
        ProductCategoryDTO rez = super.update(instance);
        reindexService.reindexProduct(rez.getProductId());
        return rez;
    }

    /**
     * {@inheritDoc}
     */
    public boolean isAssignedCategoryProductIds(final long categoryId, final long productId) {

        return ((DtoProductCategoryService) getGenericDTOService()).isAssignedCategoryProductIds(categoryId, productId);

    }

    /**
     * {@inheritDoc}
     */
    public void remove(long id) throws UnmappedInterfaceException, UnableToCreateInstanceException {
        try {

            final Map<String, Object> param = new HashMap<String, Object>();
            param.put(AsyncContext.WEB_SERVICE_URI, systemService.getBackdoorURI());

            final AsyncContext flex = new AsyncFlexContextImpl(param);

            remoteBackdoorService.reindexProduct(flex, this.getById(id).getProductId());
        } catch (Exception e) {
            LOG.error("Cant reindex product which was referenced by product category record with id  " + id, e);
        }
        super.remove(id);
    }
}