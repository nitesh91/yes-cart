package org.yes.cart.service.dto.impl;

import dp.lib.dto.geda.adapter.repository.ValueConverterRepository;
import dp.lib.dto.geda.assembler.DTOAssembler;
import org.yes.cart.dao.EntityFactory;
import org.yes.cart.domain.dto.AttrValueDTO;
import org.yes.cart.domain.dto.factory.DtoFactory;
import org.yes.cart.exception.UnableToCreateInstanceException;
import org.yes.cart.exception.UnmappedInterfaceException;
import org.yes.cart.service.domain.GenericService;
import org.yes.cart.service.dto.GenericDTOService;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * User: Igor Azarny iazarny@yahoo.com
 * Date: 09-May-2011
 * Time: 14:12:54
 */
public abstract class AbstractDtoServiceImpl<DTOIFACE, DTOIMPL, IFACE> implements GenericDTOService<DTOIFACE> {

    protected final DtoFactory dtoFactory;

    protected final DTOAssembler assembler;

    protected GenericService<IFACE> service;

    private final Map<String, Object> valueConverterRepository;

    /** {@inheritDoc}*/
    public GenericService<IFACE> getService() {
        return service;
    }

    /** {@inheritDoc} */
    public List<DTOIFACE> getAll() throws UnmappedInterfaceException, UnableToCreateInstanceException {
        final List<IFACE> entities = service.findAll();
        final List<DTOIFACE> dtos = new ArrayList<DTOIFACE>(entities.size());
        fillDTOs(entities, dtos);
        return dtos;
    }

    /** {@inheritDoc} */
    public DTOIFACE getById(long id) throws UnmappedInterfaceException, UnableToCreateInstanceException {
        return getById(id, valueConverterRepository);
    }

    /** {@inheritDoc} */
    public DTOIFACE getById(long id, final Map converters)
            throws UnmappedInterfaceException, UnableToCreateInstanceException {
        final IFACE entity = service.getById(id);
        if (entity != null) {
            final DTOIFACE dto = (DTOIFACE) dtoFactory.getByIface(getDtoIFace());
            assembler.assembleDto(dto, entity, converters, dtoFactory);
            return dto;
        }
        return null;
    }

    /** {@inheritDoc} */
    public DTOIFACE getNew() throws UnableToCreateInstanceException, UnmappedInterfaceException {
        return (DTOIFACE) dtoFactory.getByIface( getDtoIFace());
    }

    /** {@inheritDoc} */
    public void remove(long id) {
        service.delete(service.getById(id));
    }


    /**
     * Convert list of  entities to dtos
     * @param entities list of entities
     * @throws UnmappedInterfaceException in case of config errors
     * @throws UnableToCreateInstanceException ion case of dto creating errors
     * @return list of dto
     */
    public List<DTOIFACE> getDTOs(Collection<IFACE> entities) 
            throws UnmappedInterfaceException, UnableToCreateInstanceException {
        List<DTOIFACE> result = new ArrayList<DTOIFACE>();
        if (entities != null) {
            fillDTOs(entities, result);
        }
        return result;
    }

    /**
     * Fill dtos from entities
     * @param entities list of entities
     * @param dtos list of dtos
     * @throws UnmappedInterfaceException in case of config errors
     * @throws UnableToCreateInstanceException ion case of dto creating errors
     */
    public void fillDTOs(Collection<IFACE> entities, Collection<DTOIFACE> dtos)
            throws UnmappedInterfaceException, UnableToCreateInstanceException {
        for (IFACE entity : entities) {
            DTOIFACE dto = (DTOIFACE) dtoFactory.getByIface(getDtoIFace());
            assembler.assembleDto(dto, entity, valueConverterRepository, dtoFactory);
            dtos.add(dto);
        }
    }

    /**
     * Construct base remote service.
     * @param dtoFactory {@link DtoFactory}
     * @param service {@link org.yes.cart.service.domain.GenericService}
     * @param valueConverterRepository {@link dp.lib.dto.geda.adapter.repository.ValueConverterRepository}
     */
    public AbstractDtoServiceImpl(final DtoFactory dtoFactory,
                                  final GenericService<IFACE> service,
                                  final ValueConverterRepository valueConverterRepository) {
        this.dtoFactory = dtoFactory;
        this.service = service;
        this.assembler = DTOAssembler.newAssembler(getDtoImpl(), getEntityIFace());
        if (valueConverterRepository == null) {
            this.valueConverterRepository = null;
        } else {
            this.valueConverterRepository = valueConverterRepository.getAll();
        }
    }

    /**
     * Get the converters repository.
     * @return converters repository.
     */
    public Map<String, Object> getValueConverterRepository() {
        return valueConverterRepository;
    }

    /**
     * @return {@link EntityFactory}
     */
    public EntityFactory getEntityFactory() {
        return service.getGenericDao().getEntityFactory();
    }

    /**
     *
     * @return {@link DtoFactory}
     */
    public DtoFactory getDtoFactory() {
        return dtoFactory;
    }

    /**
     * @return {@link DTOAssembler}
     */
    public DTOAssembler getAssembler() {
        return assembler;
    }

    /** {@inheritDoc}*/
    public abstract DTOIFACE create(DTOIFACE instance)
            throws UnmappedInterfaceException, UnableToCreateInstanceException;

    /** TODO think about refactoring */
    /*private DTOIFACE create2(final DTOIFACE instance)
            throws UnmappedInterfaceException, UnableToCreateInstanceException {
        IFACE iface = getEntityFactory().getByKey(getEntityIFace());
        assembler.assembleEntity(instance, iface, null, getDtoFactory());
        iface = service.create(iface);

        return null;
    } */



    /** {@inheritDoc}*/
    public abstract DTOIFACE update(DTOIFACE instance)
            throws UnmappedInterfaceException, UnableToCreateInstanceException;

    /**
     * Get the dto interface.
     * @return dto interface.
     */
    public abstract Class<DTOIFACE> getDtoIFace();

    /**
     * Get the dto implementation class.
     * @return dto implementation class.
     */
    public abstract Class<DTOIMPL> getDtoImpl();

    /**
     * Get the entity interface.
     * @return entity interface.
     */
    public abstract Class<IFACE> getEntityIFace();




    /**
     * Get the attribute codes. Used by business entity, that has attributes.
     * @param attrValues list of attribute values.
     * @return list of attribute codes.
     */
    protected List<String> getCodes(final List<? extends AttrValueDTO> attrValues) {
        final List<String> codes = new ArrayList<String>(attrValues.size());
        for(AttrValueDTO attrValueCategoryDTO : attrValues) {
            codes.add(
                    attrValueCategoryDTO.getAttributeDTO().getCode()
            );
        }
        return codes;
    }


}
